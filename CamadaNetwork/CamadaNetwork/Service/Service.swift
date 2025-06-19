//
//  Service.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors on 18/06/25.
//

import UIKit

struct ErrorHandler: Error {
    let message: String
    let statusCode: Int?
}

class Service {

    static func fetchListUser(completion: @escaping (Result<[User], ErrorHandler>) -> Void) {
        
        // URL Fornecida
        let urlString = "https://reqres.in/api/users?page=2"
        
//        Verificar se esta no formato da URL e se é uma URL válida, e, transformar ela em um tipo URL
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorHandler(message: "URL Inválida", statusCode: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error {
                completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
                return
    }
            
//            HTTPURLResponse é um tipo que vc usa para entender o resultado da resposta HTTP, ou seja, o status code
//            So que o URLResponse e'um tipo generico
//            Vc precisa fazer o cast para HTTPURLResponse
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ErrorHandler(message: "Resposta inválida do servidor", statusCode: nil)))
                return
            }
            
//            Verifica se o status code esta entre o 200 a 299, se SIM é porque o BackEnd retornou sucesso.
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(ErrorHandler(message: "Status code fora do esperado", statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data else { return }
            
            do {
                let userDetail = try JSONDecoder().decode(UserListDetail.self, from: data)
                completion(.success(userDetail.data))
            } catch {
                completion(.failure(ErrorHandler(message: "Erro ao processar os dados recebidos \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
                return
            }
        }
        task.resume()// Inicia a requisição
    }
    
    
    
}
