//
//  HomeDetailListCell.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 09/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

protocol HomeDetailListCellProtocol {
    func actionWhenTapTheCell()
}

class HomeDetailListCell: UITableViewCell, GetCellIdentifierProtocol {

    open var delegate: HomeDetailListCellProtocol?
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var setHourLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var setStateLabel: UILabel!
    
    @IBAction func moreDetailsButton(_ sender: Any) {
        
        delegate?.actionWhenTapTheCell()
    }
    
}
