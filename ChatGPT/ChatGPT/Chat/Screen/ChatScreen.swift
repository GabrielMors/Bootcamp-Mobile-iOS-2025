//
//  ChatScreen.swift
//  ChatGPT
//
//  Created by Gabriel Mors on 28/05/25.
//

import UIKit

class ChatScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blue
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        #warning("Registrar células de chat")
        return tableView
    }()
    
    lazy var messageInputView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        return view
    }()
    
    lazy var messageBarView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appLight
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var inputMessageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "Digite aqui..."
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.backgroundColor = .clear
        return textField
    }()
    
    lazy var sendButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "send"), for: .normal)
        button.backgroundColor = .buttonColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 22
        button.isEnabled = false
        button.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedSendButton() {
        
    }
    
    public func configureTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func addSubViews() {
        addSubview(tableView)
        addSubview(messageInputView)
        addSubview(sendButton)
        messageInputView.addSubview(messageBarView)
        messageInputView.addSubview(inputMessageTextField)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: messageInputView.topAnchor),
            
            messageInputView.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageInputView.trailingAnchor.constraint(equalTo: trailingAnchor),
            messageInputView.heightAnchor.constraint(equalToConstant: 80),
            messageInputView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
            
            messageBarView.leadingAnchor.constraint(equalTo: messageInputView.leadingAnchor, constant: 20),
            messageBarView.trailingAnchor.constraint(equalTo: messageInputView.trailingAnchor, constant: -20),
            messageBarView.heightAnchor.constraint(equalToConstant: 55),
            messageBarView.centerYAnchor.constraint(equalTo: messageInputView.centerYAnchor),
            
            sendButton.heightAnchor.constraint(equalToConstant: 55),
            sendButton.widthAnchor.constraint(equalToConstant: 55),
            sendButton.trailingAnchor.constraint(equalTo: messageBarView.trailingAnchor, constant: -15),
            sendButton.bottomAnchor.constraint(equalTo: messageBarView.bottomAnchor, constant: -15),
            
            inputMessageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -4),
            inputMessageTextField.leadingAnchor.constraint(equalTo: messageBarView.leadingAnchor, constant: 20),
            inputMessageTextField.heightAnchor.constraint(equalToConstant: 45),
            inputMessageTextField.centerYAnchor.constraint(equalTo: messageBarView.centerYAnchor)
        ])
    }
    
    
}
