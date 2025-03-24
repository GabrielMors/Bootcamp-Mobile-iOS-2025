//
//  main.swift
//  Estrutura de Repetições
//
//  Created by Gabriel Mors on 14/03/25.
//


// Chave -> {}
// Parêntese -> ()

import Foundation

//MARK: Estrutura de repetição

// While

// O While é uma estrutura de repetição que fica repetindo ENQUANTO a Condição for verdade

var idade: Int = 1

while idade < 18 {
    print("Você é menor de idade, pois você tem \(idade) anos")
    idade += 1
}
print("Você é maior de idade, pois você tem \(idade) anos")

// Repeat
//O repeat é uma estrutura de repetição que EXECUTA PRIMEIRAMENTE, e no final ele questiona se deve repetir ou não

var indexRepeat: Int = 1

repeat {
    print("Index: \(indexRepeat)")
    indexRepeat = indexRepeat + 1
} while indexRepeat <= 5

print("Index Final \(indexRepeat)")

// For in
// O FOR é uma estrutura de repetição que trabalha com SEQUENCIA (Uma lista de itens) que ela percorre item a item desta lista e conseguindo capturar o valor de cada um dos items.
// Antes do IN você coloca o nome que vc quiser
// O que vem antes do IN é o valor da posição da lista


for numero in 0...10 {
    print("número: \(numero)")
}

