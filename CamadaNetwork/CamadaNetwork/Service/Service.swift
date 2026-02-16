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
        let urlString = "https://retoolapi.dev/31tqtt/users"
        
        //        Verificar se esta no formato da URL e se é uma URL válida, e, transformar ela em um tipo URL
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorHandler(message: "URL Inválida", statusCode: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in // Inicia a tarefa de rede
            
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
                let userDetail = try JSONDecoder().decode([User].self, from: data)
                completion(.success(userDetail))
            } catch {
                completion(.failure(ErrorHandler(message: "Erro ao processar os dados recebidos \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
                return
            }
        }
        task.resume()// Inicia a requisição
    }
    
    static func fetchUser(id: Int, completion: @escaping (Result<User, ErrorHandler>) -> Void) {
        
        let urlString = "https://retoolapi.dev/YfhvOt/users/\(id)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorHandler(message: "URL Inválida", statusCode: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ErrorHandler(message: "Resposta inválida do servidor", statusCode: nil)))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(ErrorHandler(message: "Status code fora do esperado", statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data else { return }
            
            do {
                let userDetail = try JSONDecoder().decode(User.self, from: data)
                completion(.success(userDetail))
            } catch {
                completion(.failure(ErrorHandler(message: "Erro ao processar os dados recebidos \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
                return
            }
        }
        task.resume() // Inicia a requisição
    }
    
    static func createUser(name: String, job: String, completion: @escaping (Result<UserCreateResponse, ErrorHandler>) -> Void) {
        
        // URL fonrcecida
        let urlString = "https://retoolapi.dev/YfhvOt/users"
        
        // Verificar se esta no formato da URL e se é uma URL válida, e, transformar ela em um tipo URL
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorHandler(message: "URL Inválida", statusCode: nil)))
            return
        }
        
        let parameters: [String: Any] = [
            "name": name,
            "job": job
        ]
        
        //        Serve para transformar um objeto Swift (Normalmente um dicionário [String: Any]) em um Data no formato JSON, será enviado no corpo da requisição HTTP.
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters) else {
            completion(.failure(ErrorHandler(message: "Erro ao converter os parâmetros", statusCode: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = httpBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error {
                completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ErrorHandler(message: "Resposta inválida do servidor", statusCode: nil)))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                let bodyString = String(data: data ?? Data(), encoding: .utf8) ?? "Sem body"
                print("HTTP \(httpResponse.statusCode) - \(bodyString)")
                
                completion(.failure(ErrorHandler(message: "Status code fora do esperado", statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data else { return }
            
            do {
                let object = try JSONDecoder().decode(UserCreateResponse.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(ErrorHandler(message: "Erro ao processar os dados recebidos \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
                return
            }
        }
        task.resume()
    }
    
    static func updateUserParameters(name: String, job: String, id: Int, completion: @escaping (Result<UserUpdateResponse, ErrorHandler>) -> Void) {
        
        let urlString = "https://retoolapi.dev/YfhvOt/users/\(id)"
        
        // Verificar se o formato da URL é valida, e transformar ela em um tipo URL
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorHandler(message: "URL inválida", statusCode: nil)))
            return
        }
        
        // Cria o corpo da requisição com os parâmetros
        let parameters: [String: Any] = [
            "name": name,
            "job": job
        ]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters) else {
            completion(.failure(ErrorHandler(message: "Error ao converter os parâmetros", statusCode: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = httpBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // estamos verificando se existe o error e com isso removendo sua opcionalidade
            if let error {
                completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ErrorHandler(message: "Resposta inválida do servidor.", statusCode: nil)))
                return
            }
            
            // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou sucesso! Caso contrario, error!
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(ErrorHandler(message: "Status code fora do esperado.", statusCode: httpResponse.statusCode)))
                return
            }
            
            // Removendo opcionalidade
            //    guard let data = data else { return }
            guard let data else { return }
            
            do {
                let objc = try JSONDecoder().decode(UserUpdateResponse.self, from: data)
                completion(.success(objc))
            } catch {
                completion(.failure(ErrorHandler(message: "Error ao processar os dados recebidos: \(error.localizedDescription)", statusCode: httpResponse.statusCode)))
                return
            }
        }
        // Inicia a requisição
        task.resume()
    }
    
    
    static func deleteUser(id: Int, completion: @escaping (Result<Void, ErrorHandler>) -> Void) {
        
        let urlString = "https://retoolapi.dev/YfhvOt/users/\(id)"
        
        // Verificar se o formato da URL é valida, e transformar ela em um tipo URL
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorHandler(message: "URL inválida", statusCode: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // estamos verificando se existe o error e com isso removendo sua opcionalidade
            if let error {
                completion(.failure(ErrorHandler(message: error.localizedDescription, statusCode: nil)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ErrorHandler(message: "Resposta inválida do servidor.", statusCode: nil)))
                return
            }
            
            // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou sucesso! Caso contrario, error!
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(ErrorHandler(message: "Status code fora do esperado.", statusCode: httpResponse.statusCode)))
                return
            }
            completion(.success(()))
        }
        // Inicia a requisição
        task.resume()
    }
}
