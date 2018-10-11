//
//  DetailLocalWeatherNetwork.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 11/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation
import Alamofire

class DetailLocalWeatherNetwork {
    
    var detailLocalWeather: [LocalWeatherDetailResponse]?
    var sessionManager: SessionManager?

    func fetchDetailLocalWeatherService(localWeatherUrl: String, success succed: @escaping ([LocalWeatherDetailResponse]) -> Void,
                                        failure: @escaping (Error) -> Void) {
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "opendata.aemet.es": .disableEvaluation
        ]
        
        sessionManager = SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        sessionManager?.request(localWeatherUrl, method: .get).responseJSON { [weak self] (response) in
            
            guard let `self` = self else { return }
            
            guard let weatherResponse = response.data else { return }

            do {
                self.detailLocalWeather = try JSONDecoder().decode([LocalWeatherDetailResponse].self, from: weatherResponse)
                
                guard let detailResponse = self.detailLocalWeather else { return }
                succed(detailResponse)

            } catch {
                failure(error)
            }
        }
    }
}
