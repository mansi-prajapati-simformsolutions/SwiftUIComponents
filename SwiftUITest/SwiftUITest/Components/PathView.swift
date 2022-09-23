//
//  GridView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 30/09/22.
//

import SwiftUI

struct PathView: View {

    @Environment(\.calendar) var calendar
    @State var dates: Set<DateComponents> = []
    @State private var current = 30.0
    @State private var max = 100.0
    @State private var min = 0.0
    
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 20, y: 0))
                path.addLine(to: CGPoint(x: 20, y: 50))
                path.addLine(to: CGPoint(x: 50, y: 50))
                path.addLine(to: CGPoint(x: 50, y: 0))
            }.fill(LinearGradient(gradient: .init(colors: [.green, .blue, .cyan]), startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.5, y: 0.5)))
            // print("\($dates)")
            Gauge(value: current, in: min...max) {
                Image(systemName: "thermometer")
                    .font(.caption)
            } currentValueLabel: {
                Text("\(Int(current))")
            } minimumValueLabel: {
                Text("\(Int(min))")
            } maximumValueLabel: {
                Text("\(Int(max))")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(Gradient(colors: [.green, .yellow, .orange, .red, .pink]))
            Slider(value: $current, in: min...(max)) {
                Text("Mimic weather")
            }
            LabeledContent("Count", value: "0").padding()
            Spacer()
            Text(date.description)
            MultiDatePicker("Select your preferred dates", selection: $dates)
        }
    }

    var date: [String] {
        dates.compactMap { components in
            calendar.date(from: components)?.formatted(date: .long, time: .omitted)
        }
    }

}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
