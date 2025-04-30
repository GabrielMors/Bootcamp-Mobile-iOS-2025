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
    
    func showEditAlert(for indexPath: IndexPath) {
        let alert = UIAlertController(title: "Editar Nome", message: "Digite o novo nome do usuário", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.text = self.userList[indexPath.row].name // Preencher o textField com o nome Atual
        }
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default) { _ in
            if let newName = alert.textFields?.first?.text, !newName.isEmpty {
                // Atualizar o nome do usuário
                self.userList[indexPath.row].name = newName
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func shareUser(at indexPath: IndexPath) {
        let user = userList[indexPath.row] // Selecionando o Usuário a partir da linha
        
        let itemsToShare: [Any] = [user.name, user.image] // item que irão ser compartilhados
        
//        Aqui você poderia passar ações personalizadas.
        let activityController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        // selecionando os itens para compartilhar e quais ações irão fazer

     
        // Para iPad, evitar crash ao abrir
        if let popoverController = activityController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = tableView.rectForRow(at: indexPath)
        }
        
        present(activityController, animated: true)// Mostra uma modal
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //MARK: Deletar
        let deleteAction = UIContextualAction(style: .destructive, title: "Deletar") { _, _, completionHander in
            self.userList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHander(true)
        }
//        Configuração do botão
        deleteAction.backgroundColor = .red
        
        //MARK: Editar
        let editAction = UIContextualAction(style: .destructive, title: "Editar") { _, _, completionHander in
//            Ação
            self.showEditAlert(for: indexPath)
            completionHander(true)
        }
        editAction.backgroundColor = .blue
        
        //MARK: Compartilhar
        let shareAction = UIContextualAction(style: .destructive, title: "Compartilhar") { _, _, completionHander in
            self.shareUser(at: indexPath)
            completionHander(true)
        }
        shareAction.backgroundColor = .orange
        
//         Quais botões irão ser apresentados
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteAction, editAction, shareAction])
        
        return swipeAction
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
