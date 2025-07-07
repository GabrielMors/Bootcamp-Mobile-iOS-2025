//
//  Teste_UnitarioTests.swift
//  Teste-UnitarioTests
//
//  Created by Gabriel Mors Pulga on 07/07/25.
//

import XCTest
@testable import Teste_Unitario

final class Teste_UnitarioTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUpWithError() throws {
        viewController = ViewController()
    }

    override func tearDownWithError() throws {
        viewController = nil
    }
    
    func testExample() throws {
        let valorTotal = 10 + 10
        XCTAssertEqual(21, valorTotal)
    }

    func testPerformanceExample() throws {
        
    }

}

