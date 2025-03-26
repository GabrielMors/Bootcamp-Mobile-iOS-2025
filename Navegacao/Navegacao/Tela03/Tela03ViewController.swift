//
//  Tela03ViewController.swift
//  Navegacao
//
//  Created by Gabriel Mors on 27/03/25.
//

import UIKit

class Tela03ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tappedBackToRootButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
