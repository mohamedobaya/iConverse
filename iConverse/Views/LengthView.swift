//
//  LengthView.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import SwiftUI

struct LengthView: View {
    @State var selectedMainLengthUnit: LengthUnit = .meters
    @State var selectedTargetLengthUnit: LengthUnit = .kilometers
    @State private var inputLength = 0.0
    private var outputLength: Double {
        converseLength(value: inputLength, from: selectedMainLengthUnit, to: selectedTargetLengthUnit)
    }
    
    @FocusState.Binding var isUnitInputFocused: Bool
    
    private var unitText: String {
        switch selectedTargetLengthUnit {
        case .meters:
            "m"
        case .kilometers:
            "km"
        case .feet:
            "ft"
        case .yards:
            "yd"
        case .miles:
            "mi"
        }
    }
    
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
            Text("\(Int(outputLength)) \(unitText)")
        }
        

    }
}

#Preview {
    @FocusState var isUnitInputFocused: Bool
    Form {
        LengthView(isUnitInputFocused: $isUnitInputFocused)
    }
}
