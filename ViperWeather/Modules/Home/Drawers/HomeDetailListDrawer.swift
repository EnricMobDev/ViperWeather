//
//  HomeDetailListDrawer.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 09/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import UIKit

internal final class HomeDetailListDrawer: CellDrawerProtocol {
    
    // MARK: - CellDrawerProtocol
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        tableView.register(UINib(nibName: HomeDetailListCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: HomeDetailListCell.cellIdentifier())
        
        return tableView.dequeueReusableCell(withIdentifier: HomeDetailListCell.cellIdentifier(), for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any) {
        
        guard let cell = cell as? HomeDetailListCell,
            let item = item as? HomeDetailList else { return }
        
        cell.selectionStyle = .none
        cell.hourLabel.text = item.hourText
        cell.setHourLabel.text = item.setHourText
        cell.stateLabel.text = item.stateText
        cell.setStateLabel.text = item.setStateText
        cell.delegate = item.delegate
    }
}

// MARK: - DrawerItemProtocol
extension HomeDetailList: DrawerItemProtocol {
    
    var cellDrawer: CellDrawerProtocol {
        
        return HomeDetailListDrawer()
    }
}
