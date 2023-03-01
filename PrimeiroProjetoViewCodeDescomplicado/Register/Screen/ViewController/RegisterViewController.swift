//
//  RegisterViewController.swift
//  PrimeiroProjetoViewCodeDescomplicado
//
//  Created by admin on 28/02/23.
//

import UIKit

class RegisterViewController: UIViewController {

    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
