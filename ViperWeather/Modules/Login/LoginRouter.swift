//
//  LoginRouter.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class LoginRouter: LoginPresenterToRouterProtocol{
    
    class func createModule() -> UIViewController{
        let view = LoginViewController()
        let presenter: LoginViewToPresenterProtocol & LoginInteractorToPresenterProtocol = LoginPresenter()
        let interactor: LoginPresenterToInteractorProtocol = LoginInteractor()
        let router: LoginPresenterToRouterProtocol = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func navigateToHome(_ origin: UIViewController, _ username: String) {

        origin.present(HomeRouter.createModule(username), animated: true)
    }
}
