//
//  Tela03Screen.swift
//  TabBar + NotificationCenter
//
//  Created by Gabriel Mors Pulga on 02/07/25.
//

import UIKit

class Tela03Screen: UIView {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        addEleements()
        configureConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addEleements() {
        addSubview(nameLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
