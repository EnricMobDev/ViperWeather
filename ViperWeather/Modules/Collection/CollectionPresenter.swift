//
//  CollectionPresenter.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright (c) 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

class CollectionPresenter: NSObject, CollectionViewToPresenterProtocol, UICollectionViewDataSource {
    
    var view: CollectionPresenterToViewProtocol?
    var interactor: CollectionPresenterToInteractorProtocol?
    var router: CollectionPresenterToRouterProtocol?
    
    var createCollectionViews: [DetailDrawerItemProtocol] = []
    
    func updateView() {
        interactor?.fetchSomething()
        view?.detailCollectionView.dataSource = self
        
        guard let detailCollectionView = view?.detailCollectionView else { return }
        configure(detailCollectionView)
        
        let collection = CollectionDetail(skyLabel: "Cloudy", hourLabel: "12:00h")
        createCollectionViews.append(collection)
        
        let SecondCollection = CollectionDetail(skyLabel: "Cloudy", hourLabel: "12:00h")
        createCollectionViews.append(SecondCollection)
        
        let ThirdCollection = CollectionDetail(skyLabel: "Cloudy", hourLabel: "12:00h")
        createCollectionViews.append(ThirdCollection)
    }
    
    // MARK: - UICollectionViewDataSource
    fileprivate func configure(_ collectionView: UICollectionView) {
        
        guard let layout = view?.detailCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
       
        guard let frameWidth = view?.detailCollectionView.frame.width else { return }
        let width = (frameWidth - 20) / 3
        
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return createCollectionViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = createCollectionViews[indexPath.row]
        let drawer = item.collectionDrawer
        
        let collection = drawer.collectionView(collectionView, didSelectItemAt: indexPath)
        
        drawer.drawCollection(collection, withItem: item)
        
        return collection
    }
}

extension CollectionPresenter: CollectionInteractorToPresenterProtocol {
    
    func somethingFetched(argument: CollectionModel) {
        view?.showSomething(argument: argument)
    }
}
