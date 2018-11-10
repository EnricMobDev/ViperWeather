//
//  HomePresenter.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit
import Foundation

class HomePresenter: NSObject, HomeViewToPresenterProtocol, UITableViewDataSource {
    
    // MARK: - Variables
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    var createCells: [DrawerItemProtocol] = []
    
    // MARK: - Constants
    let ESTIMATED_ROW_HEIGHT: CGFloat = 80
    
    func setUpView() {
        
        guard let homeDetailTable = view?.homeDetailTableView else { return }
        configure(homeDetailTable)
        view?.homeDetailTableView.dataSource = self
    }
    
    func updateView() {
        interactor?.fetchLocalWeather()
    }
    
    func actionWhenTapTheCell() {
        
        guard let viewController = view as? UIViewController else { return }
        router?.navigateToCollection(originViewController: viewController)
    }
    
    func userTapTheCell() {
        print("Whatssss")
    }
    
    // MARK: - UITableViewDelegate, UITableViewDatasource
    fileprivate func configure(_ tableView: UITableView) {
        
        view?.homeDetailTableView.rowHeight = UITableView.automaticDimension
        view?.homeDetailTableView.estimatedRowHeight = CGFloat(ESTIMATED_ROW_HEIGHT)
        view?.homeDetailTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return createCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = createCells[indexPath.row]
        let drawer = item.cellDrawer
        
        let cell = drawer.tableView(tableView, cellForRowAt: indexPath)
        drawer.drawCell(cell, withItem: item)
        
        return cell
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func fetchedWeatherSuccess(data: [LocalWeatherDetailResponse]) {
        
        for predictions in data {
            guard let predictionDay = predictions.prediccion?.dia else { return }
            
            for day in predictionDay {
                guard let skyState = day.estadoCielo else { return }
                
                for dayDetail in skyState {
                    guard let hour = dayDetail.periodo else { return }
                    guard let description = dayDetail.descripcion else { return }
                    
                    createCellWith(hour: hour, sky: description)
                }
            }
        }
        view?.homeDetailTableView.reloadData()
    }
    
    func fetchedWeatherFailed(error: String) {
        print(error)
    }
    
    
//    func detailWeatherResponseSucceed(_ response: [LocalWeatherDetailResponse]) {
//
//        for predictions in response {
//            guard let predictionDay = predictions.prediccion?.dia else { return }
//
//            for day in predictionDay {
//                guard let skyState = day.estadoCielo else { return }
//
//                for dayDetail in skyState {
//                    guard let hour = dayDetail.periodo else { return }
//                    guard let description = dayDetail.descripcion else { return }
//
//                    createCellWith(hour: hour, sky: description)
//                }
//            }
//        }
//        view?.homeDetailTableView.reloadData()
//    }
    
    func createCellWith(hour: String, sky: String) {
        
        guard let delegate = view?.homeDetailTableView.delegate as? HomeDetailListCellProtocol else { return }
        
        let cell = HomeDetailList(hourText: "Hour", setHourText: "\(hour):00h", stateText: "State", setStateText: sky, delegate: delegate)
        createCells.append(cell)
    }
    
    func detailWeatherResponseFailed(_ error: Error) {
        print(error)
    }
    
    func somethingFetched(argument: HomeModel) {
        view?.showSomething(argument: argument)
    }
}
