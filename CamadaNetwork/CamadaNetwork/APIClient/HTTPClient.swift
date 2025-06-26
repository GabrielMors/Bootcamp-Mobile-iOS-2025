//
//  HTTPClient.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 25/06/25.
//

import Foundation

protocol HTTPClient {
    // Forma generica
    func request<T: Decodable>(request: APIRequest, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}
