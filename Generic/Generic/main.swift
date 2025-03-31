//
//  main.swift
//  Generic
//
//  Created by Gabriel Mors on 28/03/25.
//

import Foundation


var name = "Gabriel"

// Sem generico

func imprimirText(_ texto: String) -> Void {
    print(texto)
}

func imprimirNumero(numero: Int) -> Void {
    print(numero)
}

func imprimirNumeroDecimal(_ valor: Double) -> Void {
    print(valor)
}


imprimirText("Gabriel Mors")
imprimirNumero(numero: 25)

// Com generico

func imprimir<T>(_ item: T) {
    print("Item: \(item)")
}

imprimir(10)
imprimir("Gabriel")
imprimir(false)


let listaDeFrutas: [String] = ["Abacaxi", "Banana", "Laranja"]
let listaDeNumeros: [Int] = [1, 2, 3, 4, 5]

func pegarPrimeiroItem<T>(lista: [T]) -> T? {
    lista.first
}

print(pegarPrimeiroItem(lista: listaDeFrutas) ?? "")
print(pegarPrimeiroItem(lista: listaDeNumeros) ?? 0)



func mostrarConteudoIfElse<T>(conteudo: T) {
    if let numero = conteudo as? Int {
        print("Isso é o meu número: \(numero)")
    } else if let texto = conteudo as? String {
        print("Oi, meu nome é: \(texto)")
    } else {
        print("Outro tipo nao especificado: \(conteudo)")
    }
}


mostrarConteudoIfElse(conteudo: "Gabriel")
mostrarConteudoIfElse(conteudo: 10)
mostrarConteudoIfElse(conteudo: false)
