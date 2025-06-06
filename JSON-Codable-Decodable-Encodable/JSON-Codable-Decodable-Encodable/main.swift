//
//  main.swift
//  JSON-Codable-Decodable-Encodable
//
//  Created by Gabriel Mors on 06/06/25.
//

import Foundation

// MARK: JSON
//

// Exemplo Objeto

"""
{
    "nome": "Gabriel Mors"
    "idade": 30
    "professor" true
    "cursos": ["iOS", "Swift", "SwiftUI"]
    "endereco": {
    "cidade": "Maringa"
    "estado": "PR"
  }
}
"""

struct Professor {
    var nome: String
    var idade: Int
    var professor: Bool
    var cursos: [String]
    var endereco: Endereco
}

struct Endereco {
    var cidade: String
    var estado: String
}




//{
//    "pessoa": {
//        "nome": "Wellinton"
//        "Idade": 34
//    }
//}




// Exemplo Lista



//[
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//    {
//    "nome": "Gabriel"
//    },
//]


struct Veiculo {
    var id: Int
    var marca: String
    var modelo: String
    var ano: Int
    var acessorios: [Acessorios]
}


struct Acessorios {
    var nome: String
    var preco: Double
    var configuracaoAcessorio: ConfiguracaoAcessorio
}

struct ConfiguracaoAcessorio {
    var tipo: String
    var dataCriacao: String
}

// Objeto com valores


let veiculo = Veiculo(
    id: 101,
    marca: "Toytota",
    modelo: "Corola",
    ano: 2022,
    acessorios: [
        Acessorios(
            nome: "Teto solar",
            preco: 5000.00,
            configuracaoAcessorio: ConfiguracaoAcessorio(
                tipo: "Luxo",
                dataCriacao: "2021-02-10")
        ),
        Acessorios(
            nome: "Multimidia",
            preco: 5000.00,
            configuracaoAcessorio: ConfiguracaoAcessorio(
                tipo: "Luxo",
                dataCriacao: "2021-02-10")
        ),
    ]

)


//MARK: Decodable

//MARK: Encodable

//MARK: Codable
