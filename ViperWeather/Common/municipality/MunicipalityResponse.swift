//
//  MunicipalityResponse.swift
//  ViperWeather
//
//  Created by Enric Pou Villanueva on 04/10/2018.
//  Copyright © 2018 Enric Pou Villanueva. All rights reserved.
//

import Foundation

typealias MunicipalityResponse = [HeaderElement]

struct HeaderElement {
    let origen: Origen?
    let elaborado, nombre, provincia: String?
    let prediccion: Prediccion?
    let id, version: String?
}

struct Origen {
    let productor: String?
    let web, enlace: String?
    let language, copyright: String?
    let notaLegal: String?
}

struct Prediccion {
    let dia: [Dia]?
}

struct Dia {
    let estadoCielo: [EstadoCielo]?
    let precipitacion, probPrecipitacion, probTormenta, nieve: [HumedadRelativa]?
    let probNieve, temperatura, sensTermica, humedadRelativa: [HumedadRelativa]?
    let vientoAndRachaMax: [VientoAndRachaMax]?
    let fecha, orto, ocaso: String?
}

struct EstadoCielo {
    let value, periodo: String?
    let descripcion: Descripcion?
}

enum Descripcion {
    case despejado
    case pocoNuboso
}

struct HumedadRelativa {
    let value, periodo: String?
}

struct VientoAndRachaMax {
    let direccion: [Direccion]?
    let velocidad: [String]?
    let periodo, value: String?
}

enum Direccion {
    case e
    case n
    case ne
    case no
    case o
    case se
}

