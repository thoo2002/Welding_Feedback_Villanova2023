//
//  SavedProjectView.swift
//  Real_time
//
//  Created by Alex Rhodes on 9/2/23.
//

import SwiftUI
import Foundation

struct SavedProjectView: View {
    @State private var gauge1Value: Double = 500
    @State private var gauge2Value: Double = 75
    @State private var gauge3Value: Double = 90
    @State private var gauge4Value: Double = 25
    @State private var gauge5Value: Double = 10
    
    // Add the saveData function to save the gauge values
    func saveData() {
        let data = [
            "gauge1Value": gauge1Value,
            "gauge2Value": gauge2Value,
            "gauge3Value": gauge3Value,
            "gauge4Value": gauge4Value,
            "gauge5Value": gauge5Value
        ]
        DataHandler.saveData(data, to: "projectData.json")
    }
    
    // Add the loadData function to load the saved gauge values
    func loadData() {
        if let data = DataHandler.loadData(from: "projectData.json") as? [String: Double] {
            gauge1Value = data["gauge1Value"] ?? 0
            gauge2Value = data["gauge2Value"] ?? 0
            gauge3Value = data["gauge3Value"] ?? 0
            gauge4Value = data["gauge4Value"] ?? 0
            gauge5Value = data["gauge5Value"] ?? 0
        }
    }
    
    var body: some View {
        VStack {
            // Your existing code for displaying the gauges
            
            Button("Save Data") {
                saveData()
            }
            .padding()
            
            Button("Load Data") {
                loadData()
            }
            .padding()
        }
    }
}
