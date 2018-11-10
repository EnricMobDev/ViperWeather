//
//  APIConfiguration.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 02/11/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: Alamofire.URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
