//
//  ViewController.swift
//  LifeCycle
//
//  Created by Gabriel Mors on 04/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        print(#function)
    }
    
    // Metodo quando a tela é RENDERIZADA (Ou seja, será disparado apenas 1 vez!!!!!!)
    // Antes da view ser exibida esse metodo é chamado automaticamente
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print(#function)
//        Configuracoes iniciais da view
    }
    
    // Metodo quando a tela esta preste a ser apresentado
    // Antes da view aparecer, esse metodo é chamado
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        // Configuracoes dew navegacao entre telas
//        Atualizar dados e interface antes de ser exibida.
//        navigationController?.navigationBar.isHidden = true
    }
    
    
    // Metodo quando a tela esta apresentado por completo
    //APARECEU PRO USUARIO
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
//        Iniciar animações, chamadas de rede, timers, animacao etc.
    }

    // Metodo quando a tela esta preste a sair (Ou seja, antes da tela sair, esse metodo é chamado)
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
        // Timer e animacao
//        salvar dados temporários, cancelar tarefas
    }
    
    // Metodo quando a tela desapareceu por completo
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        // Timer e animacao
//        Liberar recursos, remover observadores, encerrar processos.
    }
    
    deinit {
        print("ViewController foi desalocado da memória")
    }
    
    @IBAction func tappedGoButton(_ sender: UIButton) {
        guard let controller = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela02ViewController.self)) as? Tela02ViewController else { return }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

