//
//  LoginPresenter.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class LoginPresenter: LoginViewToPresenterProtocol {
    
    var view: LoginPresenterToViewProtocol?
    var interactor: LoginPresenterToInteractorProtocol?
    var router: LoginPresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchSomething()
    }
    
    func login(_ username: String, _ password: String) {

        if username == "Enric" && password == "Pou" {
            
            guard let viewController = view as? UIViewController else {return}
            router?.navigateToHome(viewController, username)
            
        } else {            
            print("Nombre de usuario o contraseña incorrecto")
        }
    }
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    
    func somethingFetched(argument: LoginModel) {

    }
}
