//
//  SavedProjectView.swift
//  Real_time
//
//  Created by Alex Rhodes on 9/2/23.
//

import SwiftUI
import Foundation
import CoreData

struct SavedProjectView: View {
    @State private var savedFiles: [String] = []
    @State private var gauge1Value: [Double] = [500]
    @State private var gauge2Value: [Double] = [75]
    @State private var gauge3Value: [Double] = [90]
    @State private var gauge4Value: [Double] = [25]
    @State private var gauge5Value: [Double] = [10]

    // Add the Project entity as a CoreData entity
    class Project: NSObject, Identifiable, NSFetchRequestResult {
        var id = UUID()
        var gauge1Value: [Double]
        var gauge2Value: [Double]
        var gauge3Value: [Double]
        var gauge4Value: [Double]
        var gauge5Value: [Double]
        var fileName: String?

        init(gauge1Value: [Double], gauge2Value: [Double], gauge3Value: [Double], gauge4Value: [Double], gauge5Value: [Double], fileName: String?) {
            self.gauge1Value = gauge1Value
            self.gauge2Value = gauge2Value
            self.gauge3Value = gauge3Value
            self.gauge4Value = gauge4Value
            self.gauge5Value = gauge5Value
            self.fileName = fileName
        }
    }

    // Add the saveData function to save the gauge values
    func saveData() {
        let context = PersistenceController.shared.container.viewContext
        let newProject = Project(gauge1Value: gauge1Value, gauge2Value: gauge2Value, gauge3Value: gauge3Value, gauge4Value: gauge4Value, gauge5Value: gauge5Value, fileName: nil)
        PersistenceController.shared.saveContext()
    }

    // Add the loadData function to load the saved gauge values
    func loadData() {
        let context = PersistenceController.shared.container.viewContext
        let request = NSFetchRequest<Project>(entityName: "Project")
        do {
            let projects = try context.fetch(request)
            if let latestProject = projects.last {
                gauge1Value = latestProject.gauge1Value
                gauge2Value = latestProject.gauge2Value
                gauge3Value = latestProject.gauge3Value
                gauge4Value = latestProject.gauge4Value
                gauge5Value = latestProject.gauge5Value
                savedFiles = projects.map { $0.fileName ?? "" }
            }
        } catch {
            print("Error fetching projects: \(error)")
        }
    }

    var body: some View {
        VStack {
            // Code for displaying the gauges using the gaugeValues arrays
            GaugeView(value: gauge1Value.last ?? 0, label: "Current", range: 0...1000)
            GaugeView(value: gauge2Value.last ?? 0, label: "X Axis Angle", range: 0...180)
            GaugeView(value: gauge3Value.last ?? 0, label: "Y Axis Angle", range: 0...180)
            GaugeView(value: gauge4Value.last ?? 0, label: "Z Axis Angle", range: 0...180)
            GaugeView(value: gauge5Value.last ?? 0, label: "Rod Left", range: 0...100)

            Button("Save Data") {
                saveData()
            }
            .padding()

            Button("Load Data") {
                loadData()
            }
            .padding()

            List(savedFiles, id: \.self) { fileName in
                Text(fileName)
            }
        }
    }
}
