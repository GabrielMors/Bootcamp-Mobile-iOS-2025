//
//  Tela02ViewController.swift
//  TransicaoDeDados
//
//  Created by Gabriel Mors on 07/04/25.
//

import UIKit

class Tela02ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
//    var name: String = ""
    let name: String
    
    init?(coder: NSCoder, name: String) {
        self.name = name
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
    }
    
}
