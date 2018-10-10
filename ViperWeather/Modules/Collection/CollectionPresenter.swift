//
//  CollectionPresenter.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class CollectionPresenter: CollectionViewToPresenterProtocol {
    
    var view: CollectionPresenterToViewProtocol?
    var interactor: CollectionPresenterToInteractorProtocol?
    var router: CollectionPresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchSomething()
    }
}

extension CollectionPresenter: CollectionInteractorToPresenterProtocol {
    
    func somethingFetched(argument: CollectionModel) {
        view?.showSomething(argument: argument)
    }
}
