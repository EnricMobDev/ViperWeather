//
//  CollectionRouter.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class CollectionRouter: CollectionPresenterToRouterProtocol{
    
    class func createModule() -> UIViewController{
        let view = CollectionViewController()
        let presenter: CollectionViewToPresenterProtocol & CollectionInteractorToPresenterProtocol = CollectionPresenter()
        let interactor: CollectionPresenterToInteractorProtocol = CollectionInteractor()
        let router: CollectionPresenterToRouterProtocol = CollectionRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
