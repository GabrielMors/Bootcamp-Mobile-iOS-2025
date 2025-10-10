//
//  CustomTableViewCell.swift
//  CollectionView-avancado
//
//  Created by Gabriel Mors on 05/05/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameCarLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // ID da Celula
    static let identifier: String = String(describing: CustomTableViewCell.self)
    // função que coloca nosso arquivo .xib em memória
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    // lista de objetos
    var cars: [Car] = [Car(image: "car1"),
                       Car(image: "car2"),
                       Car(image: "car3"),
                       Car(image: "car4"),
                       Car(image: "car5"),
                       Car(image: "car6")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    private func configCollectionView() {
        // Assinando os protocolos da Collection
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        // Configurando o layout da CollectionView (Direção)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
           // layout.estimatedItemSize = .zero // Desativando a estimativa do tamanho da celula
        }
    }
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // Número de celulas em cada sessão
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        // Retornando um Objeto. Populando os dados da celula
        cell?.setupCell(data: cars[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Configurando tamanho da nossa celula.
        return CGSize(width: contentView.frame.width, height: 300)// Largura é do mesmo tamanho do iphone
        
    }
    
}
