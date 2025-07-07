//
//  Utils.swift
//  Teste-Unitario
//
//  Created by Gabriel Mors Pulga on 07/07/25.
//

import Foundation

//Função calcula a média de uma lista de números inteiros.
//Função para verificar se uma string é um número inteiro
//Função para gerar um número aleatório de 0 a um valor especificado
//Função para remover os espaços em branco no início e no final de uma string

class Utils {
    
    static func average(_ numbers: [Int]) -> Int {
        var total = 0
        
        for number in numbers {
            total += number
        }
        return total / numbers.count
    }
    
    
    static func isInteger(_ string: String) -> Bool {
        if let _ = Int(string) {
            return true
        } else {
            return false
        }
    }
    
    static func randomInRante(upperBound: Int) -> Int{
        return Int.random(in: 0...upperBound)
    }
    
    static func trimWhitespace(_ string: String) -> String {
        return string.trimmingCharacters(in: .whitespaces)
        
    }
}
