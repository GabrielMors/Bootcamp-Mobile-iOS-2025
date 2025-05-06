//
//  ViewController.swift
//  CollectionView-avancado
//
//  Created by Gabriel Mors on 05/05/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    private func configTableView() {
        // Assinando os protocolos
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Numero de linhas em cada sessão
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        return cell ?? UITableViewCell()
    }
    
    // Configurando a altura
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    // Função que é chamado quando a gente clica na célula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selecionado \(indexPath.row)")
    }
}
