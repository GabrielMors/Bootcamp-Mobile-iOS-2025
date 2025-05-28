//
//  ViewController.swift
//  ChatGPT
//
//  Created by Gabriel Mors on 28/05/25.
//

import UIKit

class ChatViewController: UIViewController {

    var screen: ChatScreen? = nil
    
    override func loadView() {
        screen = ChatScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        screen?.configureTableView(delegate: self, dataSource: self)
    }


}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
//    UITableViewDelegate é um protocolo responsável pelo comportamento visual e interativo da tableView
// - Altura de célula
// - Cabeçalhos/ rodapés
// - Swipe, seleção
// - Ação ao tocar
    
//    UITableViewDataSource é o protocolo responsável por fornecer os dados da tableView
// - Quantas células?
// - Qual conteúdo de cada célula?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
