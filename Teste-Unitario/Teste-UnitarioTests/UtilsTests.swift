//
//  UtilsTests.swift
//  Teste-UnitarioTests
//
//  Created by Gabriel Mors Pulga on 07/07/25.
//

import XCTest
@testable import Teste_Unitario

//Função calcula a média de uma lista de números inteiros.
//Função para verificar se uma string é um número inteiro
//Função para gerar um número aleatório de 0 a um valor especificado
//Função para remover os espaços em branco no início e no final de uma string

final class UtilsTests: XCTestCase {
    
    func testAverage() {
        let numbers = [1, 2, 3, 4, 5]
        let expectedAverage = 3
        let result = Utils.average(numbers)
        XCTAssertEqual(result, expectedAverage, "A média calculada está incorreta.")
    }
    
    func testConversation() {
        let textTrue = "10000000"
        let resultTrue = Utils.isInteger(textTrue)
        let textFalse = "10000000Text"
        let resultFalse = Utils.isInteger(textFalse)
        
        XCTAssertTrue(resultTrue, "O resultado não pode ser false, pois ele deve conseguir converter a string \(textTrue) em um Int")
        XCTAssertFalse(resultFalse, "O resultado não pode ser true, pois ele não deve conseguir converter a string \(textFalse) em um Int")
    }
    
    func testRandom() {
        let upperBound = 100
        let result = Utils.randomInRante(upperBound: upperBound)
        XCTAssertTrue(result > 0 && result <= upperBound, "O número sorteado está fora do range.")
    }
    
    func testRemove() {
        let text = "   Hello World   "
        let expected = "Hello World"
        let resultConversation = Utils.trimWhitespace(text)
        XCTAssertEqual(resultConversation, expected, "O texto não deve conter espaços no final e no início da string.")
    }
}
    
