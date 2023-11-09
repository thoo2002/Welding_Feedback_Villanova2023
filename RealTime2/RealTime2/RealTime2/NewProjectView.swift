//
//  NewProjectView.swift
//  Real_time
//
//  Created by Alex Rhodes on 9/2/23.
//

import SwiftUI
import CoreData

struct GaugeView: View {
    var value: Double
    var label: String
    var range: ClosedRange<Double>

    var body: some View {
        VStack {
            Text(label)
                .font(.headline)
            Gauge(value: value, in: range) {
                Text(String(format: "%.2f", value))
                    .font(.system(size: 28, weight: .bold, design: .rounded))
            }
        }
        .padding()
    }
}

struct NewProjectView: View {
    @State private var gauge1Values: [Double] = [500]
    @State private var gauge2Values: [Double] = [75]
    @State private var gauge3Values: [Double] = [90]
    @State private var gauge4Values: [Double] = [25]
    @State private var gauge5Values: [Double] = [10]
    
    @State private var gauge1Range: ClosedRange<Double> = 0...1000
    @State private var gauge2Range: ClosedRange<Double> = 0...180
    @State private var gauge3Range: ClosedRange<Double> = 0...180
    @State private var gauge4Range: ClosedRange<Double> = 0...180
    @State private var gauge5Range: ClosedRange<Double> = 0...100

    @State private var showSaveFileCreation = false
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Spacer()
                    GaugeView(value: gauge1Values[0], label: "Current", range: gauge1Range)

                    GaugeView(value: gauge2Values[0], label: "X Axis Angle", range: gauge2Range)

                    GaugeView(value: gauge3Values[0], label: "Y Axis Angle", range: gauge3Range)

                    GaugeView(value: gauge4Values[0], label: "Z Axis Angle", range: gauge4Range)

                    GaugeView(value: gauge5Values[0], label: "Rod Left", range: gauge5Range)

                    Spacer()
                }
                .padding(.vertical, 20)
            }
            .navigationBarTitle("New Project")
            .navigationBarItems(trailing: Button("Create Save File") {
                showSaveFileCreation = true
            })
            .sheet(isPresented: $showSaveFileCreation) {
                SaveFileCreationView()
            }
        }
        .onReceive(timer) { _ in
            // Update the gauge values here
            // For example, you can generate random values for each gauge
            gauge1Values = [Double.random(in: gauge1Range)]
            gauge2Values = [Double.random(in: gauge2Range)]
            gauge3Values = [Double.random(in: gauge3Range)]
            gauge4Values = [Double.random(in: gauge4Range)]
            gauge5Values = [Double.random(in: gauge5Range)]
        }
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}
