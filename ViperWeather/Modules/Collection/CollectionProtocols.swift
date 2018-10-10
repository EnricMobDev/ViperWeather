//
//  CollectionProtocols.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol CollectionPresenterToViewProtocol: class{
    func showSomething(argument: CollectionModel)
}

protocol CollectionInteractorToPresenterProtocol: class{
    func somethingFetched(argument: CollectionModel)
}

protocol CollectionPresenterToInteractorProtocol: class{
    var presenter: CollectionInteractorToPresenterProtocol? {get set}
    func fetchSomething()
}

protocol CollectionViewToPresenterProtocol: class{
    var view: CollectionPresenterToViewProtocol? {get set}
    var interactor: CollectionPresenterToInteractorProtocol? {get set}
    var router: CollectionPresenterToRouterProtocol? {get set}
    func updateView()
}

protocol CollectionPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}
