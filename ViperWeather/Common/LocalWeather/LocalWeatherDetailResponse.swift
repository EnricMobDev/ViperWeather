//
//  LocalWeatherDetailResponse.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation

//typealias Welcome = [WelcomeElement]

struct LocalWeatherDetailResponse: Codable {
    let origen: Origen?
    let elaborado, nombre, provincia: String?
    let prediccion: Prediccion?
    let id, version: String?
}

struct Origen: Codable {
    let productor: String?
    let web, enlace: String?
    let language, copyright: String?
    let notaLegal: String?
}

struct Prediccion: Codable {
    let dia: [Dia]?
}

struct Dia: Codable {
    let estadoCielo: [EstadoCielo]?
    let precipitacion, probPrecipitacion, probTormenta, nieve: [HumedadRelativa]?
    let probNieve, temperatura, sensTermica, humedadRelativa: [HumedadRelativa]?
    let vientoAndRachaMax: [VientoAndRachaMax]?
    let fecha, orto, ocaso: String?
}

struct EstadoCielo: Codable {
    let value, periodo, descripcion: String?
}

struct HumedadRelativa: Codable {
    let value, periodo: String?
}

struct VientoAndRachaMax: Codable {
    let direccion, velocidad: [String]?
    let periodo, value: String?
}
