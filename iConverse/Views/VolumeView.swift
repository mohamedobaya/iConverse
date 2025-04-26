//
//  VolumeView.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import SwiftUI

struct VolumeView: View {
    @State private var selectedMainVolumeUnit: VolumeUnit = .milliliters
    @State private var selectedTargetVolumeUnit: VolumeUnit = .liters
    @State private var inputVolume = 0.0
    private var outputVolume: Double {
        converseVolume(value: inputVolume, from: selectedMainVolumeUnit, to: selectedTargetVolumeUnit)
    }
    
    @FocusState.Binding var isUnitInputFocused: Bool
    
    private var unitText: String {
        switch selectedTargetVolumeUnit {
        case .milliliters:
            "mL"
        case .liters:
            "L"
        case .cups:
            "c"
        case .pints:
            "pt"
        case .gallons:
            "gal"
        }
    }
    
    var body: some View {
        Section{
            Picker("From", selection: $selectedMainVolumeUnit) {
                ForEach(VolumeUnit.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            TextField("value", value: $inputVolume, format: .number)
                .keyboardType(.decimalPad)
                .focused($isUnitInputFocused)
        }
        Section{
            Picker("To", selection: $selectedTargetVolumeUnit) {
                ForEach(VolumeUnit.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            Text("\(Int(outputVolume)) \(unitText)")
        }
    }
}

#Preview {
    @FocusState var isUnitInputFocused: Bool
    Form {
        VolumeView(isUnitInputFocused: $isUnitInputFocused)
    }
}
