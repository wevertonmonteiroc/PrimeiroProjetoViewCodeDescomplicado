//
//  RegisterScreen.swift
//  PrimeiroProjetoViewCodeDescomplicado
//
//  Created by admin on 28/02/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    func delegate(delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
         button.setTitleColor(.white, for: .normal)
         button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
         return button
    }()

    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
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
        textField.placeholder = "Digite sua Senha:"
        textField.isSecureTextEntry = true
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var registerButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        //-------------------
        self.configImageAddUserConstraints()
        self.configBackButtonConstraints()
        self.configEmailTextFieldConstraints()
        self.configPasswordTextFieldConstraints()
        self.configRegisterButtonConstraints()
        //-------------------
    }
    
    private func configSuperView() {
        self.addSubview(backButton)
        self.addSubview(self.imageAddUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
        self.configButtonEnable(false)
    }
    
    private func configBackGround() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
       
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func validateTextFields(){
        
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool){
        if enable {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    @objc func tappedLoginButton() {
        print("Usuario Cadastrado")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configImageAddUserConstraints() {
        self.imageAddUser.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
        }
    }
    
    func configBackButtonConstraints() {
        self.backButton.snp.makeConstraints { make in
            make.top.equalTo(self.imageAddUser.snp.top)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configEmailTextFieldConstraints() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.imageAddUser.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configPasswordTextFieldConstraints() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField)
            make.trailing.equalTo(self.emailTextField)
            make.height.equalTo(self.emailTextField)
        }
    }
    
    func configRegisterButtonConstraints() {
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField)
            make.trailing.equalTo(self.emailTextField)
            make.height.equalTo(emailTextField)
        }
    }
    
}
