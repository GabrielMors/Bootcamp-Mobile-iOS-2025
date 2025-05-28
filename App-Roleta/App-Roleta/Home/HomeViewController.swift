//
//  HomeViewController.swift
//  App-Roleta
//
//  Created by Gabriel Mors on 14/05/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen? = nil
    var viewModel: HomeViewModel = HomeViewModel()
//    var listPerson: [Person] = []
//    var listImage: [String] = ["Image-1","Image-2","Image-3","Image-4","Image-5"]
//    var winner: Person?
    
    lazy var alert: AlertController = {
        let alert = AlertController(controller: self)
        return alert
    }()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
        screen?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        screen?.configTableView(delegate: self, dataSources: self)
        screen?.textFieldDelegate(delegate: self)
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        FORMA DE FAZER NA ARQUITETURA MVVM
        viewModel.setPerson.isEmpty ? 1 : viewModel.setPerson.count
        
//        FORMA DE FAZER NA ARQUITETURA MVC
//        if listPerson.count == 0 {
//            return 1
//        } else {
//            return listPerson.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.setPerson.isEmpty { // quando a lista estiver vazia
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier) as? EmptyTableViewCell
            cell?.rouletteView.startRotationAnimation()
            return cell ?? UITableViewCell()
        } else {
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier) as? PersonTableViewCell
            //        FORMA DE FAZER NA ARQUITETURA MVVM
            cell?.setupCell(data: viewModel.getPerson(indexPath: indexPath))
            //        FORMA DE FAZER NA ARQUITETURA MVC
//            cell?.setupCell(data: listPerson[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        FORMA DE FAZER NA ARQUITETURA MVVM
        viewModel.selectPerson(at: indexPath)
        
//        Verificando se quem eu selecionei é o ganhador sorteado do array
        //        FORMA DE FAZER NA ARQUITETURA MVC
//        if let personWinner = winner, listPerson[indexPath.row] === personWinner {
//            alert.showAlert(title: "Parabéns!", message: "Agora é sua vez \(personWinner.name), pague a conta!!!")
//            listPerson.removeAll() // removendo todos os objetos criado da lista
//        } else  {
//            alert.showAlert(title: "Uff", message: "Voce escapou dessa vez!!!!")
//            
//        }
        screen?.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        FORMA DE FAZER NA ARQUITETURA MVVM
        return viewModel.setPerson.isEmpty ? 300 : 100
        
        //        FORMA DE FAZER NA ARQUITETURA MVC
//        if listPerson.count == 0 {
//            return 300 // Primeira celula - Animação
//        } else {
//            return 100 // Demais celulas quando crio
//        }
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Teclado sobe
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Teclado Abaixa
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        guard let text = textField.text, !text.isEmpty else { return true }
        
        //        FORMA DE FAZER NA ARQUITETURA MVVM
        viewModel.addPerson(name: text, imageList: viewModel.listImage)
        screen?.tableView.reloadData()
        textField.text = ""
        
        //        FORMA DE FAZER NA ARQUITETURA MVC
//        if !(textField.text?.isEmpty ?? false) { //Verificando se existe um texto
//            listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
//            screen?.tableView.reloadData()
//        }
        textField.text = ""
        return true
    }
}

extension HomeViewController: HomeScreenProtocol {
    
    func tappedRaffleNumberButton() {
        alert.showAlert(title: "Pronto", message: "Foi sorteado os membros que irão pagar a conta. Clique na célula e veja quem será o ganhador!")
        viewModel.randomPersonList()
    }
    
}
