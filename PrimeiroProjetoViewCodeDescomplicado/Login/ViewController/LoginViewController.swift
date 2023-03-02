//
//  ViewController.swift
//  PrimeiroProjetoViewCodeDescomplicado
//
//  Created by admin on 26/02/23.
//
import UIKit

class LoginViewController: UIViewController {
    
    //referenciando uma view com a outra
    var loginScreen:LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func actionLoginButton() {
        print("Deu certo o Login Button!!")
    }
    
    func actionRegisterButton() {
        print("Deu certo o Register Button!!")
        let vc: RegisterViewController = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)//Responsavel por levar a tela de cadastro
    }
    
    func actionBackButton() {
        print("Deu certo o Back Button!!")
//        let vc: LoginViewController = LoginViewController()
//        self.navigationController?.pushViewController(vc, animated: true)//Responsavel por levar a tela de cadastro
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
}
