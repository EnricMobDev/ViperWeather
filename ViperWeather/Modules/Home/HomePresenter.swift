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
        
        guard let delegate = view?.homeDetailTableView.delegate as? HomeDetailListCellProtocol else { return }
        
        let fiveHourCell = HomeDetailList(hourText: "Hour", setHourText: "5h", stateText: "State", setStateText: "Sunny", delegate: delegate)
        createCells.append(fiveHourCell)
        
        let sixHourCell = HomeDetailList(hourText: "Hour", setHourText: "6h", stateText: "State", setStateText: "Sunny", delegate: delegate)
        createCells.append(sixHourCell)
        
        let sevenHourCell = HomeDetailList(hourText: "Hour", setHourText: "7h", stateText: "State", setStateText: "Sunny", delegate: delegate)
        createCells.append(sevenHourCell)
    }
    
    func updateView() {
        interactor?.fetchSomething()
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
    
    func somethingFetched(argument: HomeModel) {
        view?.showSomething(argument: argument)
    }
}
