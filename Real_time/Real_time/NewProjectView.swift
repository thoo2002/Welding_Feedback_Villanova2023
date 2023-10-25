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
    var range: ClosedRange<Double>

    var body: some View {
        VStack {
            Text(label)
                .font(.headline)
            Gauge(value: value, in: range) {
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

    @State private var gauge1Range: ClosedRange<Double> = 0...100
    @State private var gauge2Range: ClosedRange<Double> = 0...100
    @State private var gauge3Range: ClosedRange<Double> = 0...100
    @State private var gauge4Range: ClosedRange<Double> = 0...100
    @State private var gauge5Range: ClosedRange<Double> = 0...100

    var body: some View {
        ScrollView {
            LazyVStack {
                Slider(value: Binding(
                    get: { self.gauge1Range.lowerBound },
                    set: { self.gauge1Range = $0 ... self.gauge1Range.upperBound }
                ), in: 0...1000, step: 1)
                GaugeView(value: gauge1Value, label: "Current", range: gauge1Range)

                Slider(value: Binding(
                    get: { self.gauge2Range.lowerBound },
                    set: { self.gauge2Range = $0 ... self.gauge2Range.upperBound }
                ), in: 0...100, step: 1)
                GaugeView(value: gauge2Value, label: "X Axis Angle", range: gauge2Range)

                Slider(value: Binding(
                    get: { self.gauge3Range.lowerBound },
                    set: { self.gauge3Range = $0 ... self.gauge3Range.upperBound }
                ), in: 0...100, step: 1)
                GaugeView(value: gauge3Value, label: "Y Axis Angle", range: gauge3Range)

                Slider(value: Binding(
                    get: { self.gauge4Range.lowerBound },
                    set: { self.gauge4Range = $0 ... self.gauge4Range.upperBound }
                ), in: 0...100, step: 1)
                GaugeView(value: gauge4Value, label: "Z Axis Angle", range: gauge4Range)

                Slider(value: Binding(
                    get: { self.gauge5Range.lowerBound },
                    set: { self.gauge5Range = $0 ... self.gauge5Range.upperBound }
                ), in: 0...100, step: 1)
                GaugeView(value: gauge5Value, label: "Rod Left", range: gauge5Range)
            }
        }
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}
