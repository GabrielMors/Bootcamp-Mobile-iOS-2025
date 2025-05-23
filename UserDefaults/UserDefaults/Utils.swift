//
//  Utils.swift
//  UserDefaults
//
//  Created by Gabriel Mors on 23/05/25.
//

import Foundation

class Utils {
    
    // Método para adicionar um valor aos UserDefaults
        static func addUserDefaults(value: Any, key: String) {
            UserDefaults.standard.set(value, forKey: key)// Define o valor para a chave especificada
            UserDefaults.standard.synchronize()// Sincroniza os dados imediantamente com o armazenamento persistente
        }
        
    // Método para remover um valor do UserDefaults
        static func removeUserDefaults(key: String) {
            UserDefaults.standard.removeObject(forKey: key) // Remove o valor associado a chave especificada
            UserDefaults.standard.synchronize()// Sincroniza os dados imediantamente com o armazenamento persistente
        }

    // Método para obter um valor do UserDefaults
        static func getUserDefaults(key: String) -> Any? {
            return UserDefaults.standard.object(forKey: key) // Retorna o valor associado á chave especificada, se existir.
        }
}
