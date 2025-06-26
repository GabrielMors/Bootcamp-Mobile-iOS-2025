//
//  GlobalService.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 25/06/25.
//

import UIKit

class GlobalService {

    
    static func fetchListUser(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        let request = APIRequest(url: "api/users?page=2")
        
        APIClient.shared.request(request: request, decodeType: UserListDetail.self) { result in
            switch result {
            case .success(let success):
                completion(.success(success.data))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    static func createUser(name: String, job: String, completion: @escaping (Result<UserDetail, NetworkError>) -> Void) {
        let resquest = APIRequest(url: "api/users",
                                  method: .post,
                                  headers: ["Content-Tyope": "Aplication/json"],
                                  parameters: .dictianary([
                                    "name": name,
                                    "job": job
                                  ]))
        
        APIClient.shared.request(request: resquest) { result in
            switch result {
            case .success(let success):
//                completion(.success(()))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
        
    }
}



