//
//  ViewController.swift
//  Navegacao
//
//  Created by Gabriel Mors on 26/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var GoScreenTwoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    @IBAction func tappedGoScreenTwoButton(_ sender: UIButton) {
        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela02ViewController") as? Tela02ViewController
        
        //MARK: Navigation
        navigationController?.pushViewController(tela02 ?? UIViewController(), animated: true)
        
//        MARK: Modal
//        tela02?.modalPresentationStyle = .overFullScreen
//        present(tela02 ?? UIViewController(), animated: true)
    }
    
}

