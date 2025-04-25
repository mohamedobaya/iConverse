//
//  TemperatureUnit.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import Foundation

enum TemperatureUnit: String, CaseIterable {
    case celsius = "celsius"
    case fahrenheit = "fahrenheit"
    case kelvin = "kelvin"
}

func celsius(_ x: Double, to temperaturehUnit: TemperatureUnit) -> Double {
    switch temperaturehUnit {
    case .fahrenheit:
        (x * (9.0 / 5.0)) + 32
    case .kelvin:
        x + 273.15
    default:
        x
    }
}

func fahrenheit(_ x: Double, to temperaturehUnit: TemperatureUnit) -> Double {
    switch temperaturehUnit {
    case .celsius:
        (x - 32) * (5.0 / 9.0)
    case .kelvin:
        (x - 32) * (5.0 / 9.0) + 273.15
    default:
        x
    }
}

func kelvin(_ x: Double, to temperaturehUnit: TemperatureUnit) -> Double {
    switch temperaturehUnit {
    case .celsius:
        x - 273.15
    case .fahrenheit:
        ((x - 273.15) * (9.0 / 5.0)) + 32
    default:
        x
    }
}

func converseTemperature(value: Double, from mainUnit: TemperatureUnit, to targetUnit: TemperatureUnit) -> Double {
    switch mainUnit {
    case .celsius:
        celsius(value, to: targetUnit)
    case .fahrenheit:
        fahrenheit(value, to: targetUnit)
    case .kelvin:
        kelvin(value, to: targetUnit)
    }
}
