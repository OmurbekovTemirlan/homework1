//
//  AuthoView.swift
//  cofeeHome
//
//  Created by Apple on 24.4.2024.
//

import UIKit

protocol AuthoViewDelegate: AnyObject{
    
    func authoDelegate(with model: AuthoViewModel)
    
}

class AuthoView: UIView {

    weak var delegate: AuthoViewDelegate?
    
    private let titleRestourant: UILabel = {
        let label = UILabel()
        label.text = "Cofee House"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Geeks"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = UIColor(named: "ColorGeeks")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let entranceLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите имя"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.systemGray.cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let phoneNumberTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите номер телефона"
        tf.keyboardType = .phonePad
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.systemGray.cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let signInBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "ColorGeeks")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        signInBtn.addTarget(self, action: #selector(signInTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setup()
    }
    
    private func setup(){
        setupAdd()
        setupLayouts()
    }
    
    private func setupAdd(){
        
        addSubview(titleRestourant)
        addSubview(titleLabel)
        addSubview(entranceLabel)
        addSubview(userNameTF)
        addSubview(phoneNumberTF)
        addSubview(signInBtn)
        
    }
    
    private func setupLayouts(){
        
        NSLayoutConstraint.activate([
            
            titleRestourant.topAnchor.constraint(equalTo: topAnchor),
            titleRestourant.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: titleRestourant.bottomAnchor, constant: 3),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            entranceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            entranceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            userNameTF.topAnchor.constraint(equalTo: entranceLabel.bottomAnchor, constant: 5),
            userNameTF.centerXAnchor.constraint(equalTo: centerXAnchor),
            userNameTF.heightAnchor.constraint(equalToConstant: 45),
            userNameTF.widthAnchor.constraint(equalToConstant: 355),
            
            phoneNumberTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 15),
            phoneNumberTF.centerXAnchor.constraint(equalTo: centerXAnchor),
            phoneNumberTF.heightAnchor.constraint(equalToConstant: 45),
            phoneNumberTF.widthAnchor.constraint(equalToConstant: 355),
            
            signInBtn.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 25),
            signInBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInBtn.heightAnchor.constraint(equalToConstant: 40),
            signInBtn.widthAnchor.constraint(equalToConstant: 120),

        ])
    }
    
    @objc
    private func signInTap() {
        let model = AuthoViewModel(name: userNameTF.text ?? "", phoneNumber: phoneNumberTF.text ?? "")
        delegate?.authoDelegate(with: model)
    }
    
}
