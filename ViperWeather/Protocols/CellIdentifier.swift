//
//  CellIdentifier.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol GetCellIdentifierProtocol {
    static func cellIdentifier() -> String
}

extension GetCellIdentifierProtocol where Self: UITableViewCell {
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
