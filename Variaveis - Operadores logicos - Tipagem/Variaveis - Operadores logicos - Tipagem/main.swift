//
//  main.swift
//  Variaveis - Operadores logicos - Tipagem
//
//  Created by Gabriel Mors on 14/03/25.
//

import Foundation

var myName = "Gabriel Mors"
print(myName)
myName = "Pedro"
print(myName)

var myLastName = "Mors"
myLastName = "1232345"


//MARK: Tipo de dados

// String -> Tipo texto "Gabriel"
// Double -> Cotem MAIS casa decimais 10.409380942534045
// Float -> Cotem MENOS casa decimais 10.4093
// Int -> Numero inteiro 10
// Bool -> True or false


var double: Double = 10.409380942534045
print(double)

var float: Float = 10.409380942534045
print(float)

var Inteiro: Int = 10
print(Inteiro)

var string: String = "Hello, World!"
print(string)

var bool: Bool = false
print(bool)

//MARK: Operadores lógicos

// Adição
var numeroAdicao1: Int = 10
var numeroAdicao2: Int = 20
var resultadoAdicao: Int = numeroAdicao1 + numeroAdicao2
print(resultadoAdicao)

// Subtração
var numeroSubtracao1: Int = 150
var numeroSubtracao2: Int = 50
var resultadoSubtracao: Int = numeroSubtracao1 - numeroSubtracao2
print(resultadoSubtracao)

// Multiplicação
var numeroMultiplicacao1: Int = 10
var numeroMultiplicacao2: Int = 20
var resultadoMultiplicacao: Int = numeroMultiplicacao1 * numeroMultiplicacao2
print(resultadoMultiplicacao)

// Divisao
var numeroDivisao1: Int = 10
var numeroDivisao2: Int = 20
var resultadoDivisao: Int = numeroDivisao1 / numeroDivisao2
print(resultadoDivisao)

//MARK: Converter Tipos

// COALECÊNCIA --> ??

var tamanhoCamisaInt: Int = 40
print(tamanhoCamisaInt)
var tamanhoCamisaString: String = String(tamanhoCamisaInt)
print(tamanhoCamisaString)


var valorString: String = "1000a"
print(valorString)
var valorInt: Int = Int(valorString) ?? 10
print(valorInt)

var numeroDouble: Double = 15.02379823745983
print(numeroDouble)
var numeroInt: Int = Int(numeroDouble)
print(numeroInt)

//MARK: Opcional
var opcional: Int? = nil
print(opcional ?? 0)

// nil -> NULO, ou seja, não existe valor
