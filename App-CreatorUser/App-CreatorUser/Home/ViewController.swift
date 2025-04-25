//
//  ViewController.swift
//  App-CreatorUser
//
//  Created by Gabriel Mors on 16/04/25.
//

import UIKit

class ViewController: UIViewController {
    //PASSO A PASSO
    
    // 1- Criar a tableView
    // 2- Fazer conexão
    // 3- ASSINAR os protocolos (UITableViewDelegate, UITableViewDataSource)
    // 4- Criar a célula
    // 5- Criar Identifier da célula
    // 6- Registrar a célula
    // 7- Popular a célula na tableView
    // 8- Retornar a célula
    
    
    //DICA: NAO ESQUEÇA DE CHAMAR AS FUNCOES

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
        configTableView()
    }

    private func setBackgroundColor() {
        view.backgroundColor = .purple
    }
    
    private func configImage(image: UIImageView) {
        image.image = UIImage(named: "user")
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
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
    }
    
    @IBAction func tappedEditButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    @IBAction func tappedAddUserButton(_ sender: UIButton) {
        addUser(image: userImage.image ?? UIImage(named: "user")!, name: nameUserTextField.text ?? "")
        nameUserTextField.text = ""
        userImage.image = UIImage(named: "user")
    }
    
    private func addUser(image: UIImage, name: String) {
        let user = User(image: image, name: name)
        userList.append(user)
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
        cell?.setupCell(user: userList[indexPath.row])
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImage.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
