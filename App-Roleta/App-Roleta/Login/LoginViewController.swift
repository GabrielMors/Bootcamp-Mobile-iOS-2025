//
//  ViewController.swift
//  App-Roleta
//
//  Created by Gabriel Mors on 07/05/25.
//

import UIKit

class LoginViewController: UIViewController {

    var screen: LoginScreen?

    // É chamado antes do viewDidLoad. Configuramos a view que vai ser apresentado
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    

}

