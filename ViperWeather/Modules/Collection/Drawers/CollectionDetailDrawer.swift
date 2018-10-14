//
//  CollectionDetailDrawer.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 14/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

internal final class CollectionDetailDrawer: CollectionDrawerProtocol {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.register(UINib(nibName: DetailCollectionViewCell.getCollectionIdentifier(), bundle: nil), forCellWithReuseIdentifier: DetailCollectionViewCell.getCollectionIdentifier())
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.getCollectionIdentifier(), for: indexPath)
    }
    
    func drawCollection(_ collectionView: UICollectionViewCell, withItem item: Any){
    
        guard let cell = collectionView as? DetailCollectionViewCell,
            let item = item as? CollectionDetail else { return }
        
        cell.hourLabel.text = item.hourLabel
        cell.skyLabel.text = item.skyLabel
    }
}

// MARK: DetailDrawerItemProtocol
extension CollectionDetail: DetailDrawerItemProtocol {
    
    var collectionDrawer: CollectionDrawerProtocol {
        return CollectionDetailDrawer()
    }
}
