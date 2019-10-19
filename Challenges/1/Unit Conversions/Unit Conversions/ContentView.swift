//
//  ContentView.swift
//  Unit Conversions
//
//  Created by Néstor I. Martínez Ostoa on 19/10/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

enum TemperatureUnit: String {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
}

struct ContentView: View {
    
    let conversions: [TemperatureUnit] = [.celsius, .fahrenheit, .kelvin]
    @State private var input: String = "0.0"
    @State private var selectedInputUnit = 0
    @State private var selectedOutputUnit = 1
    
    var output: Double {
        let convertedInput = Double(input) ?? 0.0
        var convertedOutput = 0.0
        switch (selectedInputUnit,selectedOutputUnit) {
        case (0,0),(1,1),(2,2):
            convertedOutput = convertedInput
        case (0,1):
            convertedOutput = (convertedInput * 0.8) + 32
        case (0,2):
            convertedOutput = convertedInput + 273.15
        case (1,0):
            convertedOutput = ((convertedInput - 32) * (5/9))
        case (1,2):
            convertedOutput = ((convertedInput - 32) * (5/9)) + 273.15
        case (2,0):
            convertedOutput = convertedInput - 273.15
        case (2,1):
            convertedOutput = ((convertedInput - 273.15) * (9/5)) + 32
        default:
            convertedOutput = 0.0
        }
        return convertedOutput
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Input Unit")){
                    Picker("Input", selection: $selectedInputUnit) {
                        ForEach(0 ..< self.conversions.count) {
                            Text("\(self.conversions[$0].rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    TextField("Value", text: $input)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Output Unit")){
                    Picker("Output", selection: $selectedOutputUnit) {
                        ForEach(0 ..< self.conversions.count) {
                            Text("\(self.conversions[$0].rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("\(output, specifier: "%.2f")")
                }
            }
        .navigationBarTitle(Text("Unit Conversions"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
