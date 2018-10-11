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
    //Service Response
    func detailWeatherResponseSucceed(_ response: [LocalWeatherDetailResponse])
    func detailWeatherResponseFailed(_ error: Error)
}

protocol HomePresenterToInteractorProtocol: class{
    var presenter: HomeInteractorToPresenterProtocol? {get set}
    func fetchLocalWeather()
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
    func navigateToCollection(originViewController: UIViewController)
}
