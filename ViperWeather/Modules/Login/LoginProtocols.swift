//
//  LoginProtocols.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol LoginPresenterToViewProtocol: class{
    var usernameTextField: UITextField! {get set}
    var passwordTextField: UITextField! {get set}
    var loginButton: UIButton! {get set}
}

protocol LoginInteractorToPresenterProtocol: class{
    func somethingFetched(argument: LoginModel)
}

protocol LoginPresenterToInteractorProtocol: class{
    var presenter: LoginInteractorToPresenterProtocol? {get set}
    func fetchSomething()
}

protocol LoginViewToPresenterProtocol: class{
    var view: LoginPresenterToViewProtocol? {get set}
    var interactor: LoginPresenterToInteractorProtocol? {get set}
    var router: LoginPresenterToRouterProtocol? {get set}
    func updateView()
    func login(_ username: String, _ password: String)
}

protocol LoginPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
    func navigateToHome(_ origin: UIViewController, _ username: String)
}
