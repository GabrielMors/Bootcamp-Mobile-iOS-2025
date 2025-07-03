//
//  Tela02ViewController.swift
//  TabBar + NotificationCenter
//
//  Created by Gabriel Mors Pulga on 02/07/25.
//

import UIKit

class Tela02ViewController: UIViewController {

    var screen: Tela02Screen?
    
    override func loadView() {
        screen = Tela02Screen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(changeName(_ :)), name: .changeName, object: nil)
    }
    
    @objc func changeName(_ notification: NSNotification) {
        print("Alterou o nome da tela 02")
        let text = notification.object as? String ?? "Sem nome"
        screen?.nameLabel.text = text
    }

}



