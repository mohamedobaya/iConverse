//
//  TimeUnit.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import Foundation

enum TimeUnit: String, CaseIterable {
    case seconds = "seconds"
    case minutes = "minutes"
    case hours = "hours"
    case days = "days"
}

func seconds(_ x: Double, to timeUnit: TimeUnit) -> Double {
    switch timeUnit {
    case .minutes:
        x / 60
    case .hours:
        x / 3600
    case .days:
        x / 86400
    default:
        x
    }
}

func minutes(_ x: Double, to timeUnit: TimeUnit) -> Double {
    switch timeUnit {
    case .seconds:
        x * 60
    case .hours:
        x / 60
    case .days:
        x / 1440
    default:
        x
    }
}

func hours(_ x: Double, to timeUnit: TimeUnit) -> Double {
    switch timeUnit {
    case .seconds:
        x * 3600
    case .minutes:
        x * 60
    case .days:
        x / 24
    default:
        x
    }
}

func days(_ x: Double, to timeUnit: TimeUnit) -> Double {
    switch timeUnit {
    case .seconds:
        x * 86400
    case .minutes:
        x * 1440
    case .hours:
        x * 24
    default:
        x
    }
}

func converseTime(value: Double, from mainUnit: TimeUnit, to targetUnit: TimeUnit) -> Double {
    switch mainUnit {
    case .seconds:
        seconds(value, to: targetUnit)
    case .minutes:
        minutes(value, to: targetUnit)
    case .hours:
        hours(value, to: targetUnit)
    case .days:
        days(value, to: targetUnit)
    }
}
