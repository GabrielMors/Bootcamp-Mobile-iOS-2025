//
//  CustomCollectionViewCell.swift
//  CollectionView-avancado
//
//  Created by Gabriel Mors on 05/05/25.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carImageView: UIImageView!
    
    static let identifier: String = String(describing: CustomCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // NÃO PODE FALTA
    // Referenciamos os valores do nosso objeto para nosso elemento da célula
    public func setupCell(data: Car) {
        carImageView.image = UIImage(named: data.image)
    }
    
}
