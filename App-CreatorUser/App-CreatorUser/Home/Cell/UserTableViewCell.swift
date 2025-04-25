//
//  UserTableViewCell.swift
//  App-CreatorUser
//
//  Created by Gabriel Mors on 16/04/25.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: UserTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(user: User) {
        userImage.image = user.image
        nameLabel.text = user.name
    }
    
}



