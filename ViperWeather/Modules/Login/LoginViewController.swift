//
//  LoginViewController.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var presenter: LoginViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        
    }
    
    @IBAction func loginActionButton(_ sender: Any) {
        
        if let username = usernameTextField.text, let password = passwordTextField.text {
            presenter?.login(username, password)
        }
    }
}

extension LoginViewController: LoginPresenterToViewProtocol {
    
    func showSomething(argument: LoginModel) {
    }
}
