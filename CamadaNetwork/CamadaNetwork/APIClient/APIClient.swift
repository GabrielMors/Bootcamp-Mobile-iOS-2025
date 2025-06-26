//
//  APIClient.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 23/06/25.
//

import UIKit

class APIClient: HTTPClient {
    
    static let shared = APIClient()
    
    private var session: URLSession
    private var baseURL: String
    private var requestBuilder: RequestBuilder
    private var decoder: JSONDecoder
    private var timeout: TimeInterval
    
    init(session: URLSession = URLSession.shared,
         baseURL: String? = nil,
         requestBuilder: RequestBuilder = DefaultResquetBuilder(),
         decoder: JSONDecoder = JSONDecoder(),
         timeout: TimeInterval = 6) {
        
        self.session = session
        self.requestBuilder = requestBuilder
        self.decoder = decoder
        self.timeout = timeout
        
        if let baseURL {
            self.baseURL = baseURL
        } else if let baseURLProjetc = Bundle.main.infoDictionary?["BaseURL"] as? String {
            self.baseURL = baseURLProjetc
        } else {
            self.baseURL = ""
        }
        
    }
    
    func request<T>(request: APIRequest, decodeType: T.Type = EmptyResponse.self, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        
        guard let request = requestBuilder.buildRequest(request: request, baseURL: baseURL, timeout: timeout) else {
            let url = baseURL + request.url
            let error: NetworkError = .invalidURL(url: url)
            NetworkLogger.logError(error: error, url: url)
            completion(.failure(error))
            return
        }
        
        
        
        let task = session.dataTask(with: request) { [weak self] data, response, error in
// self é a instancia da APIClient que esta executando a tarefa de rede
            
            DispatchQueue.main.async {// Tudo vai rodar na thread principal, isso é necessario para atualziar a UI ou chamar clouser que mexem com a UI
                
                NetworkLogger.log(request: request, response: response, data: data, error: error)
                
                
                guard let self else { // Se self foi desaloca, ja cancela e retorna um erro.
                    let error: NetworkError = .networkFailure(NSError(domain: "APIClient foi desalocada da memória", code: -1))
                    NetworkLogger.logError(error: error, url: request.url?.absoluteString ?? "")
                    completion(.failure(error))
                    return
                }
                
                if let error {
                    let networkError: NetworkError = .networkFailure(error)
                    NetworkLogger.logError(error: networkError, url: request.url?.absoluteString ?? "")
                    completion(.failure(networkError))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {// Verifica se a resposta é do tipo HTTPURLResponse, se não for, retorna um erro.
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    let error: NetworkError = .statusCode(code: httpResponse.statusCode)
                    NetworkLogger.logError(error: error, url: request.url?.absoluteString ?? "")
                    completion(.failure(error))
                    return
                }
                
                if decodeType == EmptyResponse.self { // Caso o tipo foi EmptyResponse, tenta instanciar e retornar um objeto vazio (sem tentar decodifciar data)
                    
                    if let emptyResponse = EmptyResponse() as? T {
                        completion(.success(emptyResponse))
                    } else {
                        let error: NetworkError = .decodingError(NSError(domain: "Erro ao decodificar EmptyResponse", code: -1))
                        NetworkLogger.logError(error: error, url: request.url?.absoluteString ?? "")
                        completion(.failure(error))
                    }
                    return
                }
                
                guard let data else {
                    NetworkLogger.logError(error: .noData, url: request.url?.absoluteString ?? "")
                    completion(.failure(.noData))
                    return
                }
                
                do {
                    let object = try self.decoder.decode(decodeType, from: data)// Tenta transformar o data(JSON) em um objeto do tipo T
                    completion(.success(object)) // Se der certo, retorna o objeto
                } catch {
                    let error: NetworkError = .decodingError(error) // Se der erro, retorna o erro de decodificação
                    NetworkLogger.logError(error: error, url: request.url?.absoluteString ?? "")
                    completion(.failure(error))
                }
            }
        }
        task.resume() // Inicia a tarefa de rede
    }
    
}
