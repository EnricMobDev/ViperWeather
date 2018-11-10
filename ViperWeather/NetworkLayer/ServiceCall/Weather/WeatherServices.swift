//
//  WeatherServices.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 02/11/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

extension APIClient {
    
    static func getDefaultWeather(completion: @escaping (LocalWeatherResponse?,Error?)->Void){
        performRequest(type: .string, serviceRouter: APIRouter.getWeather(), decoder: JSONDecoder(), dto: LocalWeatherResponse.self) { (response) in
            switch response {
            case .failure(let error):
                completion(nil,error)
            case .success(let data):
                completion(data, nil)
            }
        }
    }
    
    static func getDetailWeather(completion: @escaping ([LocalWeatherDetailResponse]?,Error?)->Void){
        performRequest(type: .json, serviceRouter: APIRouter.getDetailWeather(), decoder: JSONDecoder(), dto: [LocalWeatherDetailResponse].self) { (response) in
            switch response {
            case .failure(let error):
                completion(nil,error)
            case .success(let data):
                completion(data, nil)
            }
        }
    }
}
