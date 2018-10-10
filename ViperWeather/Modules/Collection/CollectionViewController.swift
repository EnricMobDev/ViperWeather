//
//  CollectionViewController.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var presenter: CollectionViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension CollectionViewController: CollectionPresenterToViewProtocol {
    
    func showSomething(argument: CollectionModel) {
    }
}
