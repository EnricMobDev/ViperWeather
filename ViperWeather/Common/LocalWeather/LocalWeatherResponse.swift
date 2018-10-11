//
//  LocalWeatherResponse.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation

struct LocalWeatherResponse: Codable {
    let descripcion: String?
    let estado: Int?
    let datos, metadatos: String?
}
