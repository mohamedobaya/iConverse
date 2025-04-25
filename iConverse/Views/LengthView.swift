//
//  LengthView.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import SwiftUI

struct LengthView: View {
    @State private var selectedMainLengthUnit: LengthUnit = .meters
    @State private var selectedTargetLengthUnit: LengthUnit = .kilometers
    @State private var inputLength = 0.0
    private var outputLength: Double {
        converseLength(value: inputLength, from: selectedMainLengthUnit, to: selectedTargetLengthUnit)
    }
    
    @FocusState var isUnitInputFocused: Bool
    
    var body: some View {
        Section{
            Picker("From", selection: $selectedMainLengthUnit) {
                ForEach(LengthUnit.allCases, id: \.self) { lengthUnit in
                    Text(lengthUnit.rawValue)
                }
            }
            TextField("value", value: $inputLength, format: .number)
                .keyboardType(.decimalPad)
                .focused($isUnitInputFocused)
        }
        Section{
            Picker("To", selection: $selectedTargetLengthUnit) {
                ForEach(LengthUnit.allCases, id: \.self) { lengthUnit in
                    Text(lengthUnit.rawValue)
                }
            }
            Text(outputLength, format: .number)
        }
    }
}

#Preview {
    Form {
        LengthView()
    }
}
