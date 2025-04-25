//
//  LengthUnit.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import Foundation

enum LengthUnit: String, CaseIterable {
    case meters = "meters"
    case kilometers = "kilometers"
    case feet = "feet"
    case yards = "yards"
    case miles = "miles"
}

func meters(_ x: Double, to lengthUnit: LengthUnit) -> Double {
    switch lengthUnit {
    case .kilometers:
        x / 1000
    case .feet:
        x * 3.28084
    case .yards:
        x * 1.09361
    case .miles:
        x * 0.000621371
    default:
        x
    }
}

func kilometers(_ x: Double, to lengthUnit: LengthUnit) -> Double {
    meters(x * 1000, to: lengthUnit)
}

func feet(_ x: Double, to lengthUnit: LengthUnit) -> Double {
    switch lengthUnit {
    case .meters:
        x * 0.3048
    case .kilometers:
        x * 0.0003048
    case .yards:
        x * 0.333333
    case .miles:
        x * 0.000189394
    default:
        x
    }
}

func yards(_ x: Double, to lengthUnit: LengthUnit) -> Double {
    switch lengthUnit {
    case .meters:
        x * 0.9144
    case .kilometers:
        x * 0.0009144
    case .feet:
        x * 3
    case .miles:
        x * 0.000568182
    default:
        x
    }
}

func miles(_ x: Double, to lengthUnit: LengthUnit) -> Double {
    switch lengthUnit {
    case .meters:
        x * 1609.34
    case .kilometers:
        x * 1.60934
    case .feet:
        x * 5280
    case .yards:
        x * 1760
    default:
        x
    }
}

func converseLength(value: Double, from mainUnit: LengthUnit, to targetUnit: LengthUnit) -> Double {
    switch mainUnit {
    case .meters:
        meters(value, to: targetUnit)
    case .kilometers:
        kilometers(value, to: targetUnit)
    case .feet:
        feet(value, to: targetUnit)
    case .yards:
        yards(value, to: targetUnit)
    case .miles:
        miles(value, to: targetUnit)
    }
}

