//
//  Tela01ViewController.swift
//  TabBar + NotificationCenter
//
//  Created by Gabriel Mors Pulga on 02/07/25.
//

import UIKit

class Tela01ViewController: UIViewController {

    var screen: Tela01Screen?
    
    override func loadView() {
        screen = Tela01Screen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
    }
    
        
}

extension Tela01ViewController: Tela01ScreenDelegate {
    func tappedChangeNameButton() {
        let text = screen?.nameTextField.text ?? "Sem nome"
        screen?.nameLabel.text = text
        NotificationCenter.default.post(name: .changeName, object: text)
    }
    
    
}

extension NSNotification.Name {
    static let changeName = Self("changeName")
}
        

