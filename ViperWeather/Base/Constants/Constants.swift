//
//  Constants.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 02/11/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Networking {
        struct Url {
            static let weather_url = "https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/horaria/08019/?api_key="
        }
        
        struct Key {
            static let api_key = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlcG91dmlsbGFudWV2YUBnbWFpbC5jb20iLCJqdGkiOiI4MTVhZTJmMS0wYjJkLTQxNmMtOWFlYy00ZDA5OTBmYTdhMzUiLCJpc3MiOiJBRU1FVCIsImlhdCI6MTUzNzg5OTcwOCwidXNlcklkIjoiODE1YWUyZjEtMGIyZC00MTZjLTlhZWMtNGQwOTkwZmE3YTM1Iiwicm9sZSI6IiJ9.LLB4xXFS0u_8gyMIMMBRObhCyfzw0Nlr7RhFyvmpTWU"
        }
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
