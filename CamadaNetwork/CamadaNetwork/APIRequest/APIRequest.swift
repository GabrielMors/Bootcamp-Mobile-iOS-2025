//
//  APIRequest.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 23/06/25.
//

import Foundation

struct APIRequest {
    let url: String
    let method: HTTPMethod
    let headers: [String: String]?
    let parameters: Parameters?
    
    init(url: String, method: HTTPMethod = .get, headers: [String : String]?, parameters: Parameters?) {
        self.url = url
        self.method = method
        self.headers = headers
        self.parameters = parameters
    }
}
