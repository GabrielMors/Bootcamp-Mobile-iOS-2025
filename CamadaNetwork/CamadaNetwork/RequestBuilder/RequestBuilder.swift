//
//  RequestBuilder.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 23/06/25.
//

import UIKit

protocol RequestBuilder {
    func buildRequest(request: APIRequest, baseURL: String, timeout: TimeInterval) -> URLRequest?
}

struct DefaultResquetBuilder: RequestBuilder {
    func buildRequest(request: APIRequest, baseURL: String, timeout: TimeInterval) -> URLRequest? {
        let completeURlString: String = baseURL + request.url
        
        guard let url = URL(string: completeURlString) else { return nil } 
        
        var completeRequest = URLRequest(url: url)
        completeRequest.httpMethod = request.method.rawValue
        completeRequest.allHTTPHeaderFields = request.headers
        completeRequest.timeoutInterval = timeout
        
        if let parameters = request.parameters {
            switch parameters {
            case .dictianary(let dictionary):
                completeRequest.httpBody = try? JSONSerialization.data(withJSONObject: dictionary)
            case .encodable(let encodable):
                completeRequest.httpBody = try? JSONEncoder().encode(encodable)
            }
        }
        return completeRequest
    }
}
