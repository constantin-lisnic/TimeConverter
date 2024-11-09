//
//  ContentView.swift
//  UniConversion
//
//  Created by Constantin Lisnic on 08/11/2024.
//

import SwiftUI

struct ContentView: View {
    let availableUnits: [String] = ["seconds", "minutes", "hours", "days", "weeks", "months", "years"]
    @State private var inputUnit = "minutes"
    @State private var inputValue = 0.0
    @State private var outputUnit = "seconds"
    
    private var inputValueToSeconds:Double {
        switch inputUnit {
            case "seconds": return inputValue
            case "minutes": return inputValue * 60
            case "hours": return inputValue * 3600
            case "days": return inputValue * 86400
            case "weeks": return inputValue * 604800
            case "months": return inputValue * 2592000
            case "years": return inputValue * 31536000
        default: return 0.0
            }
    }
    
    private var outputValue:Double {
        switch outputUnit {
            case "seconds": return inputValueToSeconds
            case "minutes": return inputValueToSeconds / 60
            case "hours": return inputValueToSeconds / 3600
            case "days": return inputValueToSeconds / 86400
            case "weeks": return inputValueToSeconds / 604800
            case "months": return inputValueToSeconds / 2592000
            case "years": return inputValueToSeconds / 31536000
        default: return 0.0
            }
    }
    
    var body: some View {
            NavigationStack {
                Form{
                    Section("Conver from"){
                        Picker("Select input unit", selection: $inputUnit) {
                            ForEach(availableUnits, id: \.self){
                                Text($0)
                            }
                        }
                        TextField("Enter value to convert", value: $inputValue, format: .number)
                            .keyboardType(.numberPad)
                    }
                    
                    Section("Convert into"){
                        Picker("Select output unit", selection: $outputUnit) {
                            ForEach(availableUnits, id: \.self){
                                Text($0)
                            }
                        }
                        Text("Converted value: \(outputValue.formatted(.number)) \(outputUnit)")
                    }
                }
                .navigationTitle("Time Converter")
            }
    }
}

#Preview {
    ContentView()
}
