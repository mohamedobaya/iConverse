//
//  TemperatureView.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import SwiftUI

struct TemperatureView: View {
    @State private var selectedMainTemperatureUnit: TemperatureUnit = .celsius
    @State private var selectedTargetTemperatureUnit: TemperatureUnit = .fahrenheit
    @State private var inputTemperature = 0.0
    private var outputTemperature: Double {
        converseTemperature(value: inputTemperature, from: selectedMainTemperatureUnit, to: selectedTargetTemperatureUnit)
    }
    
    @FocusState var isUnitInputFocused: Bool
    
    var body: some View {
        Section{
            Picker("From", selection: $selectedMainTemperatureUnit) {
                ForEach(TemperatureUnit.allCases, id: \.self) { lengthUnit in
                    Text(lengthUnit.rawValue)
                }
            }
            TextField("value", value: $inputTemperature, format: .number)
                .keyboardType(.decimalPad)
                .focused($isUnitInputFocused)
        }
        Section{
            Picker("To", selection: $selectedTargetTemperatureUnit) {
                ForEach(TemperatureUnit.allCases, id: \.self) { lengthUnit in
                    Text(lengthUnit.rawValue)
                }
            }
            Text(outputTemperature, format: .number)
        }
    }
}

#Preview {
    Form {
        TemperatureView()
    }
}
