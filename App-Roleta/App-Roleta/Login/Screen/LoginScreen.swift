//
//  LoginScreen.swift
//  App-Roleta
//
//  Created by Gabriel Mors on 07/05/25.
//

import UIKit

//MARK: RECEITA DE BOLO VIEWCODE
// Passo a passo


// 1 passo -> Criar a Screen (ex: LoginViewController -> LoginScreen, RegisterViewController -> RegisterScreen)
// 2 passo -> Chamar o CONSTRUTOR
// 3 passo -> Chamar no loadView
// 4 passo -> Criar os elementos (Não esqueça de chamar o translatesAutoresizingMaskIntoConstraints = false)
// 5 passo -> Adicionar elemento na view. AddSubview (Não esqueça de chamar a função)
// 6 passo -> Configurar as constraints (Não esqueça de chamar a função)




class LoginScreen: UIView {
    
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.circle.fill")
        image.contentMode = .scaleAspectFit
        image.tintColor = .blue
        return image
    }()
    
//    Frame -> layout FIXO, você desenha o retângulo inteiro
//    Auto Layout -> Layout responsivo, você define regras de posição e tamanho do ELEMENTOS.
    override init(frame: CGRect) {
        super.init(frame: frame)// Server para configurar tamanho e posição manual de um view.
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(loginLabel)
        addSubview(logoImage)
    }
    
    // Esse init é exibido caso vc queira usar sua view com Storyboard/XIB. Como você está usando viewCode, pode so colocar o fatalError. PADRÃO!!
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoImage.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}
