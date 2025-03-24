//
//  ViewController.swift
//  IBOulet -IBAction
//
//  Created by Gabriel Mors on 12/03/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Gabriel"
    }


    @IBAction func tappedEnterButton(_ sender: UIButton) {
        view.backgroundColor = .yellow
    }
    
    @IBAction func OnOffSwitch(_ sender: UISwitch) {
        view.backgroundColor = .red
    }
}

