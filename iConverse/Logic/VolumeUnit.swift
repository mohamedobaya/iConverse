//
//  VolumeUnit.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import Foundation

enum VolumeUnit: String, CaseIterable {
    case milliliters = "milliliters"
    case liters = "liters"
    case cups = "cups"
    case pints = "pints"
    case gallons = "gallons"
}

func milliliters(_ x: Double, to volumeUnit: VolumeUnit) -> Double {
    switch volumeUnit {
    case .liters:
        x / 1000
    case .cups:
        x / 284.1
    case .pints:
        x / 568.3
    case .gallons:
        x / 4546
    default:
        x
    }
}

func liters(_ x: Double, to volumeUnit: VolumeUnit) -> Double {
    switch volumeUnit {
    case .milliliters:
        x * 1000
    case .cups:
        x * 3.52
    case .pints:
        x * 1.76
    case .gallons:
        x / 4.546
    default:
        x
    }
}

func cups(_ x: Double, to volumeUnit: VolumeUnit) -> Double {
    switch volumeUnit {
    case .milliliters:
        x * 284.1
    case .liters:
        x / 3.52
    case .pints:
        x / 2
    case .gallons:
        x / 16
    default:
        x
    }
}

func pints(_ x: Double, to volumeUnit: VolumeUnit) -> Double {
    switch volumeUnit {
    case .milliliters:
        x * 568.3
    case .liters:
        x / 1.76
    case .cups:
        x * 2
    case .gallons:
        x / 8
    default:
        x
    }
}

func gallons(_ x: Double, to volumeUnit: VolumeUnit) -> Double {
    switch volumeUnit {
    case .milliliters:
        x * 4546
    case .liters:
        x * 4.546
    case .cups:
        x * 16
    case .pints:
        x * 8
    default:
        x
    }
}

func converseVolume(value: Double, from mainUnit: VolumeUnit, to targetUnit: VolumeUnit) -> Double {
    switch mainUnit {
    case .milliliters:
        milliliters(value, to: targetUnit)
    case .liters:
        liters(value, to: targetUnit)
    case .cups:
        cups(value, to: targetUnit)
    case .pints:
        pints(value, to: targetUnit)
    case .gallons:
        gallons(value, to: targetUnit)
    }
}
