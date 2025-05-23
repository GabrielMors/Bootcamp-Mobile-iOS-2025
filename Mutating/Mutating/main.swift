//
//  main.swift
//  Mutating
//
//  Created by Gabriel Mors on 23/05/25.
//

import Foundation


// AS structs e enums são tipos de valor, o que significa que, quando vc os modifica, na verdade esta trabalhando com uma cópia deles, não com o valor original. Isso é diferente das classes, que são tipos de referência. Por padrão, as funções dentro de uma struct ou enum não podem alterar as propriedades do próprio objeto.

struct Contador {
    var valor: Int = 0
    
    mutating func incrementar() {
        valor += 1
    }
    
    
}

var contador = Contador()
contador.incrementar() // 1


enum Direcao {
    case norte, sul, leste, oeste
    
    mutating func proximaDiracao() {
        switch self {
        case .norte:
            self = .leste
        case .sul:
            self = .oeste
        case .leste:
            self = .sul
        case .oeste:
            self = .norte
        }
    }
    
}

var direcaoAtual = Direcao.norte
print(direcaoAtual) // norte


direcaoAtual.proximaDiracao()
print(direcaoAtual) // leste
