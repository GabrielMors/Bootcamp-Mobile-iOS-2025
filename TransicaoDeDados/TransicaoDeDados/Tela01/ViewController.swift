//
//  ViewController.swift
//  TransicaoDeDados
//
//  Created by Gabriel Mors on 07/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }

    func configElements() {
        nameTextField.placeholder = "Digite seu nome"
//        nameTextField.delegate = self
    }
    
    @IBAction func tappedDataButton(_ sender: Any) {
//        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela02ViewController") as? Tela02ViewController
// Nao podemos acessar um elemento antes de dar vida a ele!!!!!
//        tela02?.nameLabel.text = "Gabriel Mors"
//        tela02?.name = nameTextField.text ?? ""

        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(identifier: "Tela02ViewController") { coder -> Tela02ViewController? in
            
            return Tela02ViewController(coder: coder, name: self.nameTextField.text ?? "")
        }
        
        navigationController?.pushViewController(tela02, animated: true)
    }
    
    
    //MARK: CODER é uma referencia da instancia
    // ë uma ferramenta que o sistema usa para criar uma classe a partir do arquivo Storyboard.
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
