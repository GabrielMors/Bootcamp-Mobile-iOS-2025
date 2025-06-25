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

Logger.shared.log(message: "Meu primeiro Singleton)")
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


