//
//  APIRouter.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 02/11/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case getWeather()
    case getDetailWeather()
    
    // MARK: - HHTTPMethods
    var method: HTTPMethod {
        
        switch self {
        case .getWeather, .getDetailWeather:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        
        switch self {
        case .getWeather:
            return Constants.Networking.Url.weather_url + Constants.Networking.Key.api_key
        case .getDetailWeather:
            return DynamicVariables.Networking.Url.weather_detail
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        
        switch self {
        case .getWeather:
            return nil
        case .getDetailWeather:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest: URLRequest
        
        switch self {
        case .getWeather:
            let url = try path.asURL()
            urlRequest = URLRequest(url: url)
        case .getDetailWeather:
            let url = try path.asURL()
            urlRequest = URLRequest(url: url)
        }
//
//        // MARK: - HTTP Method
//        urlRequest.httpMethod = method.rawValue
//
//        // MARK: - Headers
//        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        // MARK: - Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        //timeout
        urlRequest.timeoutInterval = 5
        
        return urlRequest
    }
}
