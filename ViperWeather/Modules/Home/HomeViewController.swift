//
//  HomeViewController.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {

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
}

extension HomeViewController: HomePresenterToViewProtocol {
    
    func showSomething(argument: HomeModel) {
    }
}
