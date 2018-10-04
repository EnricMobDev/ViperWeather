//
//  HomeRouter.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol{
    
    class func createModule(_ username: String) -> UIViewController{
        
        let view = HomeViewController()
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.username = username
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
