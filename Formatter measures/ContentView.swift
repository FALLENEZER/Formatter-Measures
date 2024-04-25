//
//  ContentView.swift
//  Formatter measures
//
//  Created by Даниил Игумнов on 25.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    let variant = ["Celsius", "Kelvin", "Kilometers", "Meters"]
    
    @State private var user_number = ""
    @State private var your_format = ""
    @State private var prefered_format = ""
    @State private var final_number = ""

    var body: some View {
        VStack(alignment: .center) {
            Text("Formatting measures")
                .font(.custom("Menlo", size: 20))
            TextField("What's to format?", text: $user_number)
                .padding(.top, 20)
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
            Text(self.final_number)
                .padding(20)
            Text("Your format")
                .padding(.bottom, 20)
            NavigationStack {
                Section {
                    Picker("Your format", selection: $your_format) {
                        ForEach(variant, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(height: 50)
            Text("Prefered format")
                .padding(20)
            NavigationStack {
                Section {
                    Picker("Your format", selection: $prefered_format) {
                        ForEach(variant, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .frame(height: 50)
            .pickerStyle(SegmentedPickerStyle())
            Button("Press Me to format", action: {
                switch (your_format, prefered_format) {
                case ("Celsius", "Kelvin"): final_number = String(Int(user_number)! + 273)
                case ("Kelvin", "Celsius"): final_number = String(Int(user_number)! - 273)
                case ("Kilometers", "Meters"): final_number = String(Int(user_number)! * 1000)
                case ("Meters", "Kilometers"): final_number = String(Double(user_number)! / 1000)
                case ("Meters", "Meters"), ("Kilometers", "Kilometers"), ("Kelvin", "Kelvin"), ("Celsius", "Celsius"): final_number = user_number
                default: final_number = "Error"
                }
            })
            .padding(50)
            .font(.custom("Menlo", size: 20))
        }
    }
}

#Preview {
    ContentView()
}
