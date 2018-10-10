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
    var homeDetailTableView: UITableView! { get set }
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
    
    func setUpView()
    func updateView()
    func actionWhenTapTheCell()
    func userTapTheCell()
}

protocol HomePresenterToRouterProtocol: class{
    static func createModule(_ username: String) -> UIViewController
}
