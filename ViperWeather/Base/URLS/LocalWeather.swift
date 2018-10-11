//
//  LocalWeather.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation

enum LocalWeather: String {
    case URL = "https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/horaria/08019"
}

public struct HeaderForGetPetitionsWith {
    var apiKey = ["api_key": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlcG91dmlsbGFudWV2YUBnbWFpbC5jb20iLCJqdGkiOiI4MTVhZTJmMS0wYjJkLTQxNmMtOWFlYy00ZDA5OTBmYTdhMzUiLCJpc3MiOiJBRU1FVCIsImlhdCI6MTUzNzg5OTcwOCwidXNlcklkIjoiODE1YWUyZjEtMGIyZC00MTZjLTlhZWMtNGQwOTkwZmE3YTM1Iiwicm9sZSI6IiJ9.LLB4xXFS0u_8gyMIMMBRObhCyfzw0Nlr7RhFyvmpTWU"]
}
