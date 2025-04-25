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
    
    @ViewBuilder var unitView: some View {
        switch selectedUnitType {
        case "length":
            LengthView()
        case "temperature":
            TemperatureView()
        case "volume":
            VolumeView()
        case "time":
            TimeView()
        default:
            LengthView()
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
        }
    }
}

#Preview {
    ContentView()
}
