//
//  main.swift
//  Funcoes
//
//  Created by Gabriel Mors on 17/03/25.
//

import Foundation

//MARK:  Funções / Métodos

// "" aspas
// () parênteses
// {} Chaves
// [] Colchetes



// Funcao simples
// funcoes sem parametro e sem retorno


func exibirNome() {
    print("Meu nome é Gabriel")
}

exibirNome() // Chamar função -> Dar vida a função

func abrirJanela() {
    let janela: String = "Janela aberta"
    print(janela)
}

abrirJanela()


// Funções com parametro

func soma(valor1: Int, valor2: Int) {
    let resultado = valor1 + valor2
    print(resultado)
}

soma(valor1: 10, valor2: 10)

func exibirSoma() {
    soma(valor1: 10, valor2: 10)
    soma(valor1: 150, valor2: 140)
    
}

exibirSoma()

func nomeIdade(nome: String, idade: Int) {
    print("Meu nome é \(nome) e tenho \(idade) anos")
}

nomeIdade(nome: "Pedro", idade: 19)

func teste(idade: Int, idade2: Double) {
    var total = idade + Int(idade2)
    print("Minha idade é \(total) anos")
}

teste(idade: 15, idade2: 10)

//MARK: Função com retorno

func meuNome() -> String {
    return "Gabriel"
}

func nome() -> Void {
    // Lógica
}

meuNome()

//MARK: Função com parametro e com retorno

func somaRetorno(valor1: Int, valor2: Int) -> Int {
    let result = valor1 + valor2
    print(result)
    return result
}

var soma: Int = somaRetorno(valor1: 1, valor2: 1)

func idade(anoNascimento: Int, anoAtual: Int) -> Int {
    let minhaIdade: Int = anoAtual - anoNascimento
    return minhaIdade
}

var minhaIdade: Int = idade(anoNascimento: 1996, anoAtual: 2025)
print(minhaIdade)

func minhaIdade(idade: Int) -> String {
    return "Minha idade é \(idade)"
}

// Função sem retorno
func test(_ example: String) -> Void {
    // TESTEEEE
}

test("Testeeee")

//MARK: Exercicios
//1 - Criar função onde ela mostre na area de debug a frase: "Olá mundo, estou aprendendo a criar minhas primeiras funções".
//2 - criar função com nome soma que tenha 3 parametros (valor1: Int, valor2: Double, valor3: Int) e que ela faça uma soma entre os valores e retorno sobre valor total.
// 3 - crie uma funcao com um parametro e com o tipo de retorno diferente do parametro
