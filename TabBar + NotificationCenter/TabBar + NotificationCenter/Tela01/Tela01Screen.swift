//
//  Tela01Screen.swift
//  TabBar + NotificationCenter
//
//  Created by Gabriel Mors Pulga on 02/07/25.
//

import UIKit

protocol Tela01ScreenDelegate: AnyObject {
    func tappedChangeNameButton()
}

class Tela01Screen: UIView {
    
    weak var delegate: Tela01ScreenDelegate?
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu nome"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var changeNameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Mudar Nome", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(changeNameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func changeNameButtonTapped() {
        delegate?.tappedChangeNameButton()
    }
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .orange
        addEleements()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addEleements() {
        addSubview(nameTextField)
        addSubview(nameLabel)
        addSubview(changeNameButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            changeNameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            changeNameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            changeNameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
