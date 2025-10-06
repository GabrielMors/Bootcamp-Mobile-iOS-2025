//
//  main.swift
//  POO
//
//  Created by Gabriel Mors on 09/04/25.
//

import Foundation

//MARK: - Classe -> Modelo de um OBJETO!
// Atributo / Propriedades = caracteristicas de um objeto
// Ações = função / métodos
// CLASSE TRABALHA COM REFERENCE TYPE!!!

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

// Criando objeto!
// Um objeto só ganha VIDA, QUANDO GERAMOS A SUA INSTANCIA QUE É O ABRE E FECHA PARENTESES ()

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

// Para alterar uma propriedade, você precisa chamar o objeto e atribuir um novo valor a propriedade
meuCarro.farolAcesso = true
meuCarro.cor = "Blue"


//MARK: Classe com metodos construtores

class Humano {
    
    var nome: String
    var peso: Double
    var idade: Int
    var profissao: String
    var altura: Double
    
//MARK: Se caso NÃO TEM VALOR INICIAL, VOCÊ PRECISA PASSAR ELE NO INIT!!!!!!
// Método Construtor -> Ele é quem seta/informa os valores iniciais!!!
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


//MARK: O mesmo se encaixa para tipagens opcionais, POIS o opcional EXISTE ALGO DE INICIO -> QUE É O NIL! Com base nisso
//MARK: não é obrigado a passar ele no construtor. Mas caso queira, sem problemas!
class Bolo {

  var peso: Double
  var preco: Double
  var sabor: [String]
  var topoDeBolo: Bool? = nil

  init(peso: Double, preco: Double, sabor: [String]) {
    self.peso = peso
    self.preco = preco
    self.sabor = sabor
  }

  func adicionarSabor(sabor: String) {
    self.sabor.append(sabor)
  }
}

var boloAniversario: Bolo = Bolo(peso: 10, preco: 200, sabor: ["Chocolate", "Baunilha"])
var boloCasamento: Bolo = Bolo(peso: 50, preco: 2000, sabor: ["Chocolate", "Baunilha", "Maça"])

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

// MARK: - Encapsulamento
// O encapsulamento é a prática de manter os detalhes de implementação de um objeto escondidos e seguros de acesso externo. Isso é feito usando modificadores de acesso para restringir o acesso às propriedades e métodos de uma classe.
// De criar variaveis/função get e set
// get -> pegar/acessar/consultar valor
// set -> setar novo valor/substituir o valor atual por um novo
// Tudo que você coloca sendo private -> ele só existe dentro daquele bloco!!


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



//MARK: Struct
// Struct Trabalha com VALUE TYPE
// Não trabalha com REFERENCIA
// Struct nao precisa do INT(construtor) de forma explicita
// struct nao trabalha com Orientação a Objeto
// Não trabalha com Herança
// So aceita estar em conformidade com PROTOCOLO


struct Sobrado {
    
    var quantidadeDePortas: Int
    var quantidadeDeBanheiros: Int
    var emConstrucao: Bool

    
}

var casaGabriel: Sobrado = Sobrado(quantidadeDePortas: 15, quantidadeDeBanheiros: 4, emConstrucao: true)
var casaRodrigo: Sobrado = Sobrado(quantidadeDePortas: 20, quantidadeDeBanheiros: 8, emConstrucao: false)


casaGabriel = casaRodrigo
print(casaGabriel.emConstrucao)// False
print(casaRodrigo.emConstrucao)// False
print(casaRodrigo.quantidadeDeBanheiros)// 8


print("-------------------------")

casaRodrigo.quantidadeDeBanheiros = 10

print(casaRodrigo.quantidadeDeBanheiros)// 10
print(casaGabriel.quantidadeDeBanheiros)// 8


struct Student {
    
    var name: String
    var age: Int
    var isDedicated: Bool
    
}

var lais = Student(name: "Lais", age: 25, isDedicated: true)

var sofia = lais
sofia.name = "Sofia"
sofia.age = 17
sofia.isDedicated = false

print(lais.name, lais.age, lais.isDedicated)
print(sofia.name, sofia.age, sofia.isDedicated)













