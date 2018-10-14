//
//  CollectionViewController.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate {
    
    var presenter: CollectionViewToPresenterProtocol?
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        detailCollectionView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension CollectionViewController: CollectionPresenterToViewProtocol {
    
    func showSomething(argument: CollectionModel) {
    }
}
