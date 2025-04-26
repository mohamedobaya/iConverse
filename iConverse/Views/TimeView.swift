//
//  TimeView.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import SwiftUI

struct TimeView: View {
    @State private var selectedMainTimeUnit: TimeUnit = .seconds
    @State private var selectedTargetTimeUnit: TimeUnit = .minutes
    @State private var inputTime = 0.0
    private var outputTime: Double {
        converseTime(value: inputTime, from: selectedMainTimeUnit, to: selectedTargetTimeUnit)
    }
    
    @FocusState.Binding var isUnitInputFocused: Bool
    
    private var unitText: String {
        switch selectedTargetTimeUnit {
        case .seconds:
            "sec"
        case .minutes:
            "min"
        case .hours:
            "hr"
        case .days:
            "days"
        }
    }
    
    var body: some View {
        Section{
            Picker("From", selection: $selectedMainTimeUnit) {
                ForEach(TimeUnit.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            TextField("value", value: $inputTime, format: .number)
                .keyboardType(.decimalPad)
                .focused($isUnitInputFocused)
                
        }
        Section{
            Picker("To", selection: $selectedTargetTimeUnit) {
                ForEach(TimeUnit.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            Text("\(Int(outputTime)) \(unitText)")
        }
    }
}

#Preview {
    @FocusState var isUnitInputFocused: Bool
    Form {
        TimeView(isUnitInputFocused: $isUnitInputFocused)
    }
}
