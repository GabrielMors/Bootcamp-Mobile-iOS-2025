//
//  Tela03ViewController.swift
//  TabBar + NotificationCenter
//
//  Created by Gabriel Mors Pulga on 02/07/25.
//

import UIKit

class Tela03ViewController: UIViewController {

    
    
    var screen: Tela03Screen?
    
    override func loadView() {
        screen = Tela03Screen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(changeName), name: .changeName, object: nil)
    }
    
    @objc func changeName(_ notification: Notification) {
        print("Alterou o nome da tela 03")
        let text = notification.object as? String ?? "Sem nome"
        screen?.nameLabel.text = text
    }
}


