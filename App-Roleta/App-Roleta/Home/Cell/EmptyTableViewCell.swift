//
//  EmptyTableViewCell.swift
//  App-Roleta
//
//  Created by Gabriel Mors on 22/05/25.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: EmptyTableViewCell.self)
    
    lazy var rouletteView: RouletteView = {
        let view = RouletteView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Insira os participantes para iniciar a roleta russa!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        selectionStyle = .none
        addSubViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(rouletteView)
        addSubview(titleLabel)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            rouletteView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            rouletteView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rouletteView.widthAnchor.constraint(equalToConstant: 150),
            rouletteView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: rouletteView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
        ])
    }
}
