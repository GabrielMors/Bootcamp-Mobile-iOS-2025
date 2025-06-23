//
//  NetworkError.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 23/06/25.
//

import UIKit

enum NetworkError {
    case invalidURL(url: String)
    case invalidResponse
    case decodingError(Error)
    case networkFailure(Error)
    case statusCode(code: Int)
    case noData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL(let url):
            return "URL inválida: \(url)"
        case .invalidResponse:
            return "Resposta inválida do servidor."
        case .decodingError(let error):
            return "Erro ao decodificar a resposta: \(error.localizedDescription)"
        case .networkFailure(let error):
            return "Falha na canexão: \(error.localizedDescription)"
        case .statusCode(let code):
            return "Status code inesperado: Código \(code)"
        case .noData:
            return "Não houve retorno da API."
        }
    }
}
