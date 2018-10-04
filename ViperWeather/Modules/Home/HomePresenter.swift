//
//  HomePresenter.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class HomePresenter: HomeViewToPresenterProtocol {
    
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    var username: String = ""
    
    func updateView() {
            view?.titleLabel.text = "Bienvenido \(username)"
        interactor?.fetchSomething()
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    
    func somethingFetched(argument: HomeModel) {
        view?.showSomething(argument: argument)
    }
}
