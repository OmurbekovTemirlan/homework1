//
//  AuthoView.swift
//  cofeeHome
//
//  Created by Apple on 23.4.2024.
//

import UIKit

class AuthoViewController: UIViewController {
    
    private let authoView = AuthoView()
    
    private let sessionManager = UserSessionManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        
        setup()
    }
    
    private func setup(){
        setupAdd()
        setupLayouts()
        
        authoView.delegate = self
        authoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupAdd(){
        view.addSubview(authoView)
    }
    
    private func setupLayouts(){
        NSLayoutConstraint.activate([
            authoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            authoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authoView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}

extension AuthoViewController: AuthoViewDelegate {
   
    func authoDelegate(with model: AuthoViewModel) {
            if sessionManager.isValid(name: model.name, phoneNumber: model.phoneNumber) {
                sessionManager.saveSession(name: model.name, phoneNumber: model.phoneNumber)
                let vc = HomeView()
                navigationController?.pushViewController(vc, animated: true)
            } else {
                showAlert(message: "Неправильно введено имя или номер телефона!")
            }
        }
    
    private func showAlert(message: String) {
           let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
    
}

