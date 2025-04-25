//
//  ContentView.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedMainLengthUnit: LengthUnit = .meters
    @State private var selectedTargetLengthUnit: LengthUnit = .kilometers
    @State private var inputLength = 0.0
    private var outputLength: Double {
        converseLength(value: inputLength, from: selectedMainLengthUnit, to: selectedTargetLengthUnit)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    Picker("From", selection: $selectedMainLengthUnit) {
                        ForEach(LengthUnit.allCases, id: \.self) { lengthUnit in
                            Text(lengthUnit.rawValue)
                        }
                    }
                    TextField("value", value: $inputLength, format: .number)
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
            .navigationTitle("iConverse")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
