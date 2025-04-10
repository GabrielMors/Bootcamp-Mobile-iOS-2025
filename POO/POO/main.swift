//
//  main.swift
//  POO
//
//  Created by Gabriel Mors on 09/04/25.
//

import Foundation

//MARK: Classe

class Casa {
    
    var numerosDeQuartos: Int = 0
    var condominio: Bool = false
    var metrosQuadrados: Double = 350.0
    var cor: String = "Branca"
    
    
    func abrirJanela() {
        print("Abriu janela")
    }
    
    func luzesAcessa() -> Bool {
        return true
    }
}

var minhaCasa: Casa = Casa()// Objeto
var casaPedro: Casa = Casa()// Objeto


class Pessoa {
    var nome: String = ""
    var idade: Int = 0
    var peso: Double = 0.0
    var altura: Double = 0.0
    
    func correr() {
        print("Correr")
    }
    
    func andar() {
        print("andar")
    }
}

var gabriel: Pessoa = Pessoa()
var lucas: Pessoa = Pessoa()


class Carro {
    var marca: String = "BMW"
    var cor: String = "red"
    var ano: Int = 2022
    var farolAcesso: Bool = false
    
    func getMarca() -> String {
        return self.marca
    }
}

var meuCarro: Carro = Carro()
print(meuCarro.farolAcesso)

meuCarro.farolAcesso = true
meuCarro.cor = "Blue"


//MARK: Classe com metodos construtores

class Humano {
    
    var nome: String
    var peso: Double
    var idade: Int
    var profissao: String
    var altura: Double
    
    
    init(nome: String, peso: Double, idade: Int, profissao: String, altura: Double) {
        self.nome = nome
        self.peso = peso
        self.idade = idade
        self.profissao = profissao
        self.altura = altura
    }
    
}
// Quando eu instanciar a classe, primeiro ele vai chamar o construtor (Init)
var felipe: Humano = Humano(nome: "Felipe", peso: 0, idade: 30, profissao: "Programador", altura: 1.80)
var tiago: Humano = Humano(nome: "Tiago", peso: 1, idade: 10, profissao: "", altura: 1.90)


//MARK: HERANÇA

class Animal {
    
    func fazerBarulho() {
        print("Barulho")
    }
    
    func andar() {
        print("Andar")
    }
    
    func comer() {
        print("Comer")
    }
}

var animal: Animal = Animal()
animal.fazerBarulho()

// Encapsulamento
// Polimorfismo

class Cachorro: Animal {
    
    internal var peso: Double
    private var idade: Int
    var raca: String
    
    init(peso: Double, idade: Int, raca: String) {
        self.peso = peso
        self.idade = idade
        self.raca = raca
    }
  
    override func fazerBarulho() {
       print("AU AU")
    }
    
    public func getRaca() -> String {
        return raca
    }
   
}

var cachorro: Cachorro = Cachorro(peso: 10.0, idade: 2, raca: "Golden")
print(cachorro.comer())

cachorro.fazerBarulho()



//MARK: REFERENCIA
class Mac {
    var modelo: String
    var ano: Int
    
    init(modelo: String, ano: Int) {
        self.modelo = modelo
        self.ano = ano
    }
}

var meuMac: Mac = Mac(modelo: "Macbook Pro M3", ano: 2024)
var lucasMac: Mac = Mac(modelo: "Macbook Air M4", ano: 2025)

print("-------------------------")

print(meuMac.modelo)
print(lucasMac.modelo)

print("-------------------------")

meuMac = lucasMac

print(meuMac.modelo)
print(lucasMac.modelo)

print("-------------------------")

lucasMac.modelo = "Macbook Pro 2017"

print(meuMac.modelo)
print(lucasMac.modelo)

print("-------------------------")

print(meuMac.ano)
print(lucasMac.ano)

print("-------------------------")

meuMac.ano = 2010
print(meuMac.ano)
print(lucasMac.ano)
