//
//  APITests.swift
//  ViperWeatherTests
//
//  Created by Dmytro Pylypenko on 11/10/18.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import XCTest
@testable import ViperWeather

class APITests: XCTestCase {
    func testDefaultWeatherRequest() {
        mock(description: "defaultWeather", timeout: 10) {[unowned self] expectation in
            APIClient.getDefaultWeather { result, error in
                defer { expectation.fulfill() }
                
                 guard let data = result else {
                    assertionFailure("DTO is not presented")
                    return
                }
                
                guard let dateURL = data.datos else {
                    assertionFailure("Date are not presented")
                    return
                }

                DynamicVariables.Networking.Url.weather_detail = dateURL
                APIClient.getDetailWeather { result, error in
                    assert(result != nil, "result is nil")

                    guard let data = result else {
                        assertionFailure("DTO is not presented")
                        return
                    }

                    XCTAssertFalse(data.isEmpty, "Data must not be empty")

                    self.testPredictions(data: data)
                }
            }
        }
    }
    
    private func testPredictions(data: [LocalWeatherDetailResponse] = []) {
        for predictions in data {
            predictions.prediccion?.dia?.forEach(testDia(_:))
            
            // TODO: next assertions
        }
    }
    
    private func testDia(_ value: Dia) {
        let skyStates = value.estadoCielo
        skyStates?.forEach(testEstadoCielo(_:))
    }
    
    private func testEstadoCielo(_ value: EstadoCielo) {
        assert(value.descripcion != nil, "Descripcion deberia ser nula")
        
        if let periodo = value.periodo {
            assert(Int(periodo) != nil, "Periodo deberia ser numero para: \(periodo)")
        }
        else {
            assertionFailure("Periodo deberia ser nula")
        }
    }
}

extension XCTestCase {
    func mock(description: String, timeout: TimeInterval, closure: (XCTestExpectation) -> Void) {
        let expectation = XCTestExpectation(description: description)
        closure(expectation)
        wait(for: [expectation], timeout: timeout)
    }
}
