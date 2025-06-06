//
//  ChatScreen.swift
//  ChatGPT
//
//  Created by Gabriel Mors on 28/05/25.
//

import UIKit
import AVFoundation

protocol ChatScreenProtocol: AnyObject {
    func didSendMessage(_ message: String)
}

class ChatScreen: UIView {
    
    private weak var delegate: ChatScreenProtocol?
    
    private var play: AVAudioPlayer?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .background
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(OutGoingTableViewCell.self, forCellReuseIdentifier: OutGoingTableViewCell.identifier)
        tableView.register(IncomingTableViewCell.self, forCellReuseIdentifier: IncomingTableViewCell.identifier)
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        return tableView
    }()
    
    lazy var messageInputView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        return view
    }()
    
    lazy var messageBarView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appLight
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var inputMessageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "Digite aqui..."
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.backgroundColor = .clear
        return textField
    }()
    
    lazy var sendButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "send"), for: .normal)
        button.backgroundColor = .buttonColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 22
        button.isEnabled = true
        button.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedSendButton() {
        playSound()
        delegate?.didSendMessage(inputMessageTextField.text ?? "Aqui quando op texto for nil")
        pushMessage()
    }
    
    public func delegate(delegate: ChatScreenProtocol) {
        self.delegate = delegate
    }
    
    public func configureTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "send", withExtension: "wav") else { return }
        // Aqui ele procura um arquivo chamado send.wav dentro do bundle principal do app
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            //AVAudioSession é usado para configurar como o app vai se comportar em relação ao áudio (ex: tocar som mesmo com o app em background, ou respeitar o modo silencioso).
            //Aqui ele define a categoria como .playback, que permite tocar som mesmo com o botão de silêncio ativado
            //Em seguida, ativa a sessão com setActive(true).
            self.play = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            //Cria um objeto AVAudioPlayer que será usado para tocar o som.
            //fileTypeHint informa que o tipo do arquivo é .wav.
            guard let player = self.play else { return }// Verifica se o player foi criado com sucesso e toca o som
            player.play()
            
        } catch {
            print("Erro ao tocar o som: \(error.localizedDescription)")// Tratamento de erro
        }
    }
    
    //MARK: Exemplo
    func fazerAlgoImportante() throws {
//        Quer dizer que essa função pode dar erro.
//        Ou seja, ela “avisa” que talvez algo dê errado durante a execução.
//       O Swift obriga você a lidar com esse possível erro usando try + do-catch, senão o código nem compila.
        
//        O try é tipo um aviso para o compilador dizendo:
//        “Eu sei que isso pode dar erro, e estou preparado pra lidar com isso.”
    }
    
    private func pushMessage() {
        inputMessageTextField.text = ""
    }
    
    private func addSubViews() {
        addSubview(tableView)
        addSubview(messageInputView)
        addSubview(sendButton)
        messageInputView.addSubview(messageBarView)
        messageInputView.addSubview(inputMessageTextField)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: messageInputView.topAnchor),
            
            messageInputView.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageInputView.trailingAnchor.constraint(equalTo: trailingAnchor),
            messageInputView.heightAnchor.constraint(equalToConstant: 80),
            messageInputView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
            
            messageBarView.leadingAnchor.constraint(equalTo: messageInputView.leadingAnchor, constant: 20),
            messageBarView.trailingAnchor.constraint(equalTo: messageInputView.trailingAnchor, constant: -20),
            messageBarView.heightAnchor.constraint(equalToConstant: 55),
            messageBarView.centerYAnchor.constraint(equalTo: messageInputView.centerYAnchor),
            
            sendButton.heightAnchor.constraint(equalToConstant: 55),
            sendButton.widthAnchor.constraint(equalToConstant: 55),
            sendButton.trailingAnchor.constraint(equalTo: messageBarView.trailingAnchor, constant: -15),
            sendButton.bottomAnchor.constraint(equalTo: messageBarView.bottomAnchor, constant: -15),
            
            inputMessageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -4),
            inputMessageTextField.leadingAnchor.constraint(equalTo: messageBarView.leadingAnchor, constant: 20),
            inputMessageTextField.heightAnchor.constraint(equalToConstant: 45),
            inputMessageTextField.centerYAnchor.constraint(equalTo: messageBarView.centerYAnchor)
        ])
    }
    
    
}
