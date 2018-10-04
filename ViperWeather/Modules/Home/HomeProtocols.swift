//
//  HomeProtocols.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol HomePresenterToViewProtocol: class{
    func showSomething(argument: HomeModel)
    var titleLabel: UILabel! {get set}
}

protocol HomeInteractorToPresenterProtocol: class{
    func somethingFetched(argument: HomeModel)
}

protocol HomePresenterToInteractorProtocol: class{
    var presenter: HomeInteractorToPresenterProtocol? {get set}
    func fetchSomething()
}

protocol HomeViewToPresenterProtocol: class{
    var view: HomePresenterToViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterToRouterProtocol? {get set}
    
    var username: String {get set}
    func updateView()
}

protocol HomePresenterToRouterProtocol: class{
    static func createModule(_ username: String) -> UIViewController
}
