//
//  CellDrawerProtocol.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 09/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import UIKit

internal protocol CellDrawerProtocol {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any)
    
}
