//
//  HomeViewController.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, HomeDetailListCellProtocol {

    @IBOutlet weak var homeDetailTableView: UITableView!
    
    var presenter: HomeViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeDetailTableView.delegate = self
        
        presenter?.setUpView()
        presenter?.updateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - HomeDetailListCellProtocol
    func actionWhenTapTheCell() {
        presenter?.actionWhenTapTheCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.userTapTheCell()
    }
}

extension HomeViewController: HomePresenterToViewProtocol {
    
    func showSomething(argument: HomeModel) {
    }
}
