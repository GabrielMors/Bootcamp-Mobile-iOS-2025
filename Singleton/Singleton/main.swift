//
//  main.swift
//  Singleton
//
//  Created by Gabriel Mors Pulga on 25/06/25.
//

import Foundation

//MARK: - O que é um Singleton?

// O Singleton é uma padrão de design que garante que uma classe tenha apenas uma instância e fornece um ponto de acesso global a essa instância. É útil quando você precisa controlar o acesso a recursos compartilhados, como conexões de banco de dados ou configurações globais.



final class Logger { // Impede que a classe seja herdada.
    
    static let shared = Logger()// Instancia statica é unica da classe
    
    private init() { }// O inicializador é privado para impedir que outras partes do código criem instâncias da classe, garantindo que só exista uma única instância da classe durante toda a execução do app.
    
    func log(message: String) {
        print("➡️ Log: \(message) ⬅️")
    }
}

Logger.shared.log(message: "Meu primeiro Singleton")
// Outro singleton
Logger.shared.log(message: "Meu segundo Singleton")



// Passo 01 - Criar classe
final class User {
    
    static let shared = User() // Passo 2 - Criar instancia compartilhada
    
    private init() { } // Passo 3 - Privar init
    
    var name: String? = nil
}

class Login {
    func fetchUser() {
        User.shared.name = "Gabriel"
    }
}

let login = Login()
login.fetchUser()// Gabriel

class DetalheDoProduto {
    var nomeUsuario = User.shared.name ?? ""
}

//User.shared.name = nil
var microondas = DetalheDoProduto()
print(microondas.nomeUsuario) // Gabriel


// MARK: - Class ou Struct em Singleton?


final class SingletonClass {
    
    static let shared = SingletonClass() // Instância única e compartilhada
    
    private init() { } // Inicializador privado para impedir a criação de outras instâncias
    
    var state: Int = 10
}


func testClassSingleton() {
    print("Valor da classe antes da atualização é: \(SingletonClass.shared.state)")// 10
    
    SingletonClass.shared.state = 50
    
    print("Valor da classe antes da atualização é: \(SingletonClass.shared.state)")// 50
    
    let newObjt = SingletonClass.shared // Isso não cria uma nova instância. newObjt é apenas outra referência para a mesma instância do singleton.
    
    newObjt.state = 20
    
    print("Valor da classe após a atualização é: \(SingletonClass.shared.state)")// 20
    print("Valor do objt após a atualização é: \(newObjt.state)")// 20
    
}

testClassSingleton()


struct StructSingleton {
    static var shared = StructSingleton()
    
    private init() { }
    
    var state: Int = 10
}


func testStructSingleton() {
    print("Valor da Struct antes da atualização é: \(SingletonClass.shared.state)")// 10
    
    StructSingleton.shared.state = 50
    var newObj = StructSingleton.shared // Faz uma cópia
    newObj.state = 20
    
    print("Valor da Struct após a atualização é: \(StructSingleton.shared.state)")//50
    print("Valor do objt após a atualização é: \(newObj.state)")// 20
}

testStructSingleton()

