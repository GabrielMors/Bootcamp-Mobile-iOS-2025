//
//  Alert.swift
//  App-Roleta
//
//  Created by Gabriel Mors on 14/05/25.
//

import UIKit

class AlertController {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true)
    }
}
