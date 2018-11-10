//
//  APIClient.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 02/11/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    enum ApiError: Error {
        case incorrectParameters
        case failedPostCall
        case jsonConversion
        case tokenExpired
        case emptyResults
    }
    
    enum ResponseType: String {
        case json
        case string
    }
    
    private static var Manager: Alamofire.SessionManager = {
        
        var serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        serverTrustPolicies = ["opendata.aemet.es": .disableEvaluation]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let manager = Alamofire.SessionManager(configuration: configuration, serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
        
        return manager
    }()
    
    static func performRequest<T:Decodable>(type: ResponseType, serviceRouter: APIRouter, decoder: JSONDecoder, dto: T.Type, completion: @escaping (Alamofire.Result<T>)-> Void) {
        
     let manager = Manager
        
        manager.request(serviceRouter).responseString { (response) in
            
            switch (response.result){
                
            case .success(_):
                do {
                    guard let secureData = response.result.value?.data(using: .utf8) else { return }
                    let jsonDecoder = JSONDecoder()
                    let dtoObject = try jsonDecoder.decode(dto.self, from: secureData)
                    completion(Alamofire.Result.success(dtoObject))
                }catch {
                    completion(Alamofire.Result.failure(ApiError.jsonConversion))
                }
                
            case .failure(_):
                completion(Alamofire.Result.failure(ApiError.failedPostCall))
            }
        }
    }
}
