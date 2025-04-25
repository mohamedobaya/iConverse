//
//  ContentView.swift
//  iConverse
//
//  Created by Mohamed Obaya on 24/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedUnitType = "length"
    let units = ["length", "volume", "temperature", "time"]
    
    @FocusState var isUnitInputFocused: Bool
    
    @ViewBuilder var unitView: some View {
        switch selectedUnitType {
        case "length":
            LengthView(isUnitInputFocused: $isUnitInputFocused)
        case "temperature":
            TemperatureView(isUnitInputFocused: $isUnitInputFocused)
        case "volume":
            VolumeView(isUnitInputFocused: $isUnitInputFocused)
        case "time":
            TimeView(isUnitInputFocused: $isUnitInputFocused)
        default:
            LengthView(isUnitInputFocused: $isUnitInputFocused)
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Unit Type", selection: $selectedUnitType) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                unitView
            }
            .navigationTitle("iConverse")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if isUnitInputFocused {
                    Button("Done") {
                        isUnitInputFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
