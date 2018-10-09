//
//  HomeDetailListCell.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 09/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol CellType {
    static func cellType() -> String
}

extension CellType where Self: UITableViewCell {
    static func cellType() -> String {
        return String(describing: self)
    }
}

class HomeDetailListCell: UITableViewCell, CellType {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var setHourLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var setStateLabel: UILabel!
    
}
