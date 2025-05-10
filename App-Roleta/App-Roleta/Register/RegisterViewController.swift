//
//  RegisterViewController.swift
//  App-Roleta
//
//  Created by Gabriel Mors on 09/05/25.
//

import UIKit

class RegisterViewController: UIViewController {

    var screen: RegisterScreen?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
}
