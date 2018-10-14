//
//  CollectionIdentifier.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 14/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol GetCollectionIdentifierProtocol {
    static func getCollectionIdentifier() -> String
}

extension GetCollectionIdentifierProtocol where Self: UICollectionViewCell {
    static func getCollectionIdentifier() -> String {
        return String(describing: self)
    }

}
