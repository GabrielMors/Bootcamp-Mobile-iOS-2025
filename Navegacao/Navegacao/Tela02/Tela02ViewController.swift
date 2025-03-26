//
//  Tela02ViewController.swift
//  Navegacao
//
//  Created by Gabriel Mors on 26/03/25.
//

import UIKit

class Tela02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    

    @IBAction func tappedGoTela03(_ sender: Any) {
        let tela03 = UIStoryboard(name: "Tela03ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela03ViewController") as? Tela03ViewController
        
        navigationController?.pushViewController(tela03 ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        
        //MARK: Navigation
        navigationController?.popViewController(animated: true)
        
        
        
        //MARK: voltar no estilo Modal
//        dismiss(animated: true)
    }
    
}
