//
//  APIClient.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 23/06/25.
//

import UIKit

protocol HTTPClient {
    // Forma generica
    func request<T: Decodable>(request: APIRequest, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class APIClient: HTTPClient {
    
//    static let shared = APIClient()
    
    private var sesstion: URLSession
    private var baseURL: String
    private var requestBuilder: RequestBuilder
    private var decoder: JSONDecoder
    private var timeout: TimeInterval
    
    init(sesstion: URLSession, baseURL: String, requestBuilder: RequestBuilder, decoder: JSONDecoder, timeout: TimeInterval) {
        self.sesstion = sesstion
        self.baseURL = baseURL
        self.requestBuilder = requestBuilder
        self.decoder = decoder
        self.timeout = timeout
        
        
    }
    
    func request<T>(request: APIRequest, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        <#code#>
    }
    
}
