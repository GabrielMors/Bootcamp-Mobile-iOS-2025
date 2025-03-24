//
//  main.swift
//  Estrutura Condicional
//
//  Created by Gabriel Mors on 17/03/25.
//

import Foundation

//MARK: Estrutura condicional


// if -> SE
// else -> SENão

// && = Todas as alternativas devem ser verdadeiras
// || OU
// / Dividir
// * Multiplica
// == Igualdade
// === Igualdade -> Objeto
// < Menor para o maior
// > Maior para o menor
// <= Menor OU IGUAL para o maior


func IMC(altura: Double, peso: Double) -> String {
    let resultado = peso / (altura * altura)
    
    if resultado <= 18.5 {
        return "Voce esta abaixo do peso! valor do IMC é \(resultado.rounded())"
    } else if resultado >= 18.6 && resultado <= 24.9 {
        return "Parabéns, voce esta no peso certo! Valor do IMC é \(resultado.rounded())"
    } else if resultado >= 25.0 && resultado <= 29.9 {
        return "voce esta um pouco acima peso! Valor do IMC é \(resultado.rounded())"
    } else if resultado >= 30.0 && resultado <= 34.9 {
        return "voce esta muito acima peso certo! Valor do IMC é \(resultado.rounded())"
    } else if resultado >= 35.0 && resultado <= 39.9 {
        return "voce esta muito cima peso certo! Obesidade grau 2 Valor do IMC é \(resultado.rounded())"
    } else {
        return "Voce esta muito acima do peso! obesidade grau 3, Valor do IMC é \(resultado.rounded())"
    }
}

print(IMC(altura: 1.79, peso: 80))


func eMaiorIdade(idade: Int) -> String {
    if idade >= 18 {
        return "É maior de idade, pois sua idade é \(idade)"
    } else {
        return "É menor de idade, pois sua idade é \(idade)"
    }
}

var maiorIdade: String = eMaiorIdade(idade: 16)
print(maiorIdade)


func vouComprarCarro(tenhoCarteira: Bool, valorCarro: Double) -> Bool {
    if tenhoCarteira == true && valorCarro >= 1000.0 {
        return true
    } else {
        return false
    }
}


var meuCarro = vouComprarCarro(tenhoCarteira: false, valorCarro: 1000.0)
print(meuCarro)
