//
//  ViewController.swift
//  ChatGPT
//
//  Created by Gabriel Mors on 28/05/25.
//

import UIKit

class ChatViewController: UIViewController {
    
    var screen: ChatScreen? = nil
    var viewModel: ChatViewModel = ChatViewModel()
    
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
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = viewModel.loadCurrentMessage(indexPath)
        
        switch message.typeMessage {
        case .user:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: OutGoingTableViewCell.identifier, for: indexPath) as? OutGoingTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
            
        case .chatGPT:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: IncomingTableViewCell.identifier, for: indexPath) as? IncomingTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow(index: indexPath)
    }
    
}
