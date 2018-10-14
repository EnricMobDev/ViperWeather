//
//  CollectionDrawerProtocol.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 14/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

internal protocol CollectionDrawerProtocol {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    func drawCollection(_ collectionView: UICollectionViewCell, withItem item: Any)
}
