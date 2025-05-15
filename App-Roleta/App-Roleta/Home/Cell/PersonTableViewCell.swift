//
//  PersonTableViewCell.swift
//  App-Roleta
//
//  Created by Gabriel Mors on 14/05/25.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: PersonTableViewCell.self)
    
    lazy var personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
       return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    lazy var cardsImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "credit-cards")
        image.contentMode = .scaleAspectFit
       return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        selectionStyle = .none
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        addSubview(personImageView)
        addSubview(nameLabel)
        addSubview(cardsImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            personImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            personImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            personImageView.widthAnchor.constraint(equalToConstant: 70),
            personImageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: cardsImageView.leadingAnchor, constant: -8),
            
            cardsImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardsImageView.widthAnchor.constraint(equalToConstant: 70),
            cardsImageView.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
}
