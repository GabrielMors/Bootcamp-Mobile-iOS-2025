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


//AnyObject é um tipo especial em Swift que representa qualquer instância de classe. Quando você coloca isso em um protocolo:
//Esse protocolo só pode ser adotado por classes.
protocol LoginScreenProtocol: AnyObject { // Limita o protocolo para ser adotado apenas por classes
    func tappedLoginButton()
}

class LoginScreen: UIView {
    
    //    A palavra weak só pode ser usada com classes.
    //    Porque só classes têm comportamento de referência e podem ser liberadas da memória (deinit). Structs não têm isso.
    private weak var delegate: LoginScreenProtocol? = nil
    
    public func delegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }
    
    //    O lazy var no Swift é literalmente um “preguiçoso” — ele só executa a closure e cria o valor quando a propriedade for usada pela primeira vez.
    //    Pensa assim:
    //    Eu não quero criar esse UILabel agora…
    //    Só vou criar quando alguém realmente usar ele.
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
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu e-mail:"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua senha:"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        delegate?.tappedLoginButton()
    }
    
    
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
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
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
            
            emailTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    
    
}
