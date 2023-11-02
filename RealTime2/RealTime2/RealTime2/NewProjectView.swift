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
                   Text(String(format: "%.2f", value))
                       .font(.system(size: 28, weight: .bold, design: .rounded))
               }
           }
           .padding()
       }
   }


struct NewProjectView: View {
    @State private var gauge1Value: Double = 500
    @State private var gauge2Value: Double = 75
    @State private var gauge3Value: Double = 90
    @State private var gauge4Value: Double = 25
    @State private var gauge5Value: Double = 10

    @State private var gauge1Range: ClosedRange<Double> = 0...1000
    @State private var gauge2Range: ClosedRange<Double> = 0...180
    @State private var gauge3Range: ClosedRange<Double> = 0...180
    @State private var gauge4Range: ClosedRange<Double> = 0...180
    @State private var gauge5Range: ClosedRange<Double> = 0...100

    var body: some View {
        ScrollView {
            LazyVStack {
                Spacer()
                Slider(value: Binding(
                    get: { self.gauge1Range.lowerBound },
                    set: { self.gauge1Range = $0 ... self.gauge1Range.upperBound }
                ), in: 0...1000, step: 1)
                .padding(.horizontal, 20)
                GaugeView(value: gauge1Value, label: "Current", range: gauge1Range)
                   

               
                GaugeView(value: gauge2Value, label: "X Axis Angle", range: gauge2Range)

               
                GaugeView(value: gauge3Value, label: "Y Axis Angle", range: gauge3Range)

               
                GaugeView(value: gauge4Value, label: "Z Axis Angle", range: gauge4Range)

                Slider(value: Binding(
                    get: { self.gauge5Range.lowerBound },
                    set: { self.gauge5Range = $0 ... self.gauge5Range.upperBound }
                ), in: 0...100, step: 1)
                .padding(.horizontal, 20)
                GaugeView(value: gauge5Value, label: "Rod Left", range: gauge5Range)
                Spacer()
            }
            .padding(.vertical, 20)
        }
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView()
    }
}
