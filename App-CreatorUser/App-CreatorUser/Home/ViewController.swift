//
//  ViewController.swift
//  App-CreatorUser
//
//  Created by Gabriel Mors on 16/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var editPhotoButton: UIButton!
    @IBOutlet weak var nameUserTextField: UITextField!
    @IBOutlet weak var addUserButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var userList: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        configImage(image: userImage)
        configButtons(button: editPhotoButton, title: "Editar Imagem", color: UIColor(red: 155/255, green: 212/255, blue: 244, alpha: 1.0))
        configButtons(button: addUserButton, title: "Adicionar", color: .blue)
        configTextField(textField: nameUserTextField)
    }

    private func setBackgroundColor() {
        view.backgroundColor = .purple
    }
    
    private func configImage(image: UIImageView) {
        image.image = UIImage(systemName: "person.circle.fill")
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
    }
    
    private func configButtons(button: UIButton, title: String, color: UIColor) {
        button.tintColor = color
        button.setTitle(title, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Arial", size: 17)
    }
    
    private func configTextField(textField: UITextField) {
        textField.placeholder = "Digite seu nome:"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 15
        textField.backgroundColor = .systemBackground
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
