//
//  RegisterScreen.swift
//  PrimeiroProjetoViewCodeDescomplicado
//
//  Created by admin on 28/02/23.
//

import UIKit

class RegisterScreen: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
         button.setTitleColor(.white, for: .normal)
 //        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
         return button
    }()

    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .gray
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu Email:"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite sua Senha:"
        textField.textColor = .darkGray
        return textField
    }()
    
//    lazy var registerButton: UIButton = {
//       let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Não tem conta? Cadastre-se!", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        button.setTitleColor(.white, for: .normal)
////        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
//        return button
//    }()
    
    lazy var registerButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
//        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        self.setupConstraints()
    }
    
    private func configSuperView() {
        self.addSubview(backButton)
        self.addSubview(self.imageAddUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    private func configBackGround() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageAddUser.widthAnchor.constraint(equalToConstant: 150),
            self.imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
        
        
        ])
    }
    
}