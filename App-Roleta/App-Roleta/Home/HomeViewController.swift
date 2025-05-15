//
//  HomeViewController.swift
//  App-Roleta
//
//  Created by Gabriel Mors on 14/05/25.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen? = nil
    
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
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}

extension HomeViewController: HomeScreenProtocol {
    
    func tappedRaffleNumberButton() {
        alert.showAlert(title: "Pronto", message: "Foi sorteado os membros que irão pagar a conta. Clique na célula e veja quem será o ganhador!")
    }
    
}
