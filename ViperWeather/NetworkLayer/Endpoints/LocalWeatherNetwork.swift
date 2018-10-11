//
//  LocalWeatherNetwork.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 10/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

class LocalWeatherNetwork {

    //MARK: - Variables
    var weatherResponse: LocalWeatherResponse?
    var sessionManager: SessionManager?
    
    func fetchLocalWeatherService(success succed: @escaping (LocalWeatherResponse) -> Void,
                                  failure: @escaping (Error) -> Void) {
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "opendata.aemet.es": .disableEvaluation
        ]
        
        sessionManager = SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        sessionManager?.request(LocalWeather.URL.rawValue, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HeaderForGetPetitionsWith().apiKey).responseString { [weak self] (response) in
            
            guard let `self` = self else { return }
            guard let secureResponse = response.result.value?.data(using: .utf8) else { return }
            
            do {
                
                self.weatherResponse = try JSONDecoder().decode(LocalWeatherResponse.self, from: secureResponse)
                
                guard let secureResponse = self.weatherResponse else { return }
                succed(secureResponse)
                
            } catch {
                failure(error)
            }
        }
    }
}
