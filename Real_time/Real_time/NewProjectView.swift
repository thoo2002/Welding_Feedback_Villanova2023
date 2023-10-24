//
//  NewProjectView.swift
//  Real_time
//
//  Created by Alex Rhodes on 9/2/23.
//

import SwiftUI

struct GaugeView: View {
    var value: Double
    var label: String

    var body: some View {
        VStack {
            Text(label)
                .font(.headline)
            Gauge(value: value, in: 0...100) {
                Text("\(value)")
            }
        }
        .padding()
    }
}

struct NewProjectView: View {
    @State private var gauge1Value: Double = 50
    @State private var gauge2Value: Double = 75
    @State private var gauge3Value: Double = 90
    @State private var gauge4Value: Double = 25
    @State private var gauge5Value: Double = 10

    var body: some View {
        VStack {
            GaugeView(value: gauge1Value, label: "Current")
            GaugeView(value: gauge2Value, label: "X Axis Angle")
            GaugeView(value: gauge3Value, label: "Y Axis Angle")
            GaugeView(value: gauge3Value, label: "Z Axis Angle")
            GaugeView(value: gauge3Value, label: "Rod Left")
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}
