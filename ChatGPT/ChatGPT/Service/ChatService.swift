//
//  ChatService.swift
//  ChatGPT
//
//  Created by Gabriel Mors on 12/06/25.
//

import UIKit

class ChatService {

    private let baseUrl: String = "https://api.openai.com" // Amarzena a URL base da API do OpenAI
    
    //    cria uma URLSession que sempre inclui os cabeçalhos authorization e Content-Type nas requisições, facilitando o uso de APIs que exigem autenticacao e dados JSON
    //  Cabeçalhos HTTP sao informacoes extras que enviamos junto com uma requisicao HTTP para fornecer detalhes sobre a requisicao ou cliente (nesse caso, seu app). Eles sao composto por pares chave e valor, e, ajudam o servidor entender o contexto da requisicao  e tratá-la
    
    var session: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(APIKeys.authToken)",
                                               "Content-Type": "application/json"
        ]
        return URLSession(configuration: configuration)
    }
    
    func requestChat(_ text: String, completion: @escaping (Result<Response, Error>) -> Void) {
        let path = "/v1/chat/completions" // Defino endpoint especificado
        let urlString = baseUrl + path // Constroi a URL completa
        
        guard let url = URL(string: urlString) else { return } // Usa guard let para verificar se é uma URL valida
        
        var request = URLRequest(url: url)// Cria uma instancia de URLRequest e define o metodo http com POST
        request.httpMethod = "POST"
        
        do {
            // Corpo da requisição (HTTPBody)
            let httpBody = Request(
                model: "gpt-4o-mini",
                messages: [MessageElement(role: "user", content: text)],
                temperature: 0.7
            )
            request.httpBody = try JSONEncoder().encode(httpBody)// Usa JSONEncoder() para codificar o httpBody como um JSON e atribui ao request.http
        } catch {
            completion(.failure(error)) // Deu ruim
            return
        }
        
        session.dataTask(with: request) { data, response, error in // Inicia uma tarefa de rede (dataTask) que envia a requisição configurada. A resposta da API ou Error, é tratado dentro do bloco de conclusão
            
            if let error = error {
                completion(.failure(error)) // Verifica se existe um erro.
            }
            
            guard let data else { return } // Verifica se existe um dado.
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)// Usa JSONDecoder() para decodificar para um objeto Swift (Response)
                completion(.success(response))// Chama a closure informando o retorno de sucesso
            } catch {
                completion(.failure(error))// Não conseguiu fazer a DECODIFICAÇÃO
            }
        }.resume() // Start da requisição
    }
}
