//
//  OutGoingTableViewCell.swift
//  ChatGPT
//
//  Created by Gabriel Mors on 04/06/25.
//

import UIKit

class OutGoingTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: OutGoingTableViewCell.self)
    
    lazy var messageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    //    layerMinXMinYCorner: Arredonda o canto superior esquerdo.
    //    layerMaxXMinYCorner: Arredonda o canto superior direito.
    //    layerMinXMaxYCorner: Arredonda o canto inferior esquerdo.
    //    layerMaxXMaxYCorner: Arredonda o conto inferior direito.
    
    lazy var messageLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .background
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: Message) {
        messageLabel.text = data.message
    }
    
    private func addSubviews() {
        addSubview(messageView)
        messageView.addSubview(messageLabel)
    }
    
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            messageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            messageView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            messageLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 15),
            messageLabel.trailingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: -15),
            messageLabel.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 15),
            messageLabel.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -15)
            
        ])
    }
}
