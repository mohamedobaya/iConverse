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
            Text(outputTime, format: .number)
        }
    }
}

#Preview {
    @FocusState var isUnitInputFocused: Bool
    Form {
        TimeView(isUnitInputFocused: $isUnitInputFocused)
    }
}
