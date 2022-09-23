//
//  BindingWrapper.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 27/09/22.
//

import SwiftUI

struct StateView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count \(count)")
            BindingView(intVal: $count)
        }
    }
}

struct BindingView: View {
    @Binding var intVal: Int
    @State private var alpha = 1.0
    @State private var angle: Double = 0

    var body: some View {
        Button("Add") {
            intVal += 2
            angle += 45
//            withAnimation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 6, initialVelocity: 10)) {
//               // alpha = 0.1
//            }
        }.rotationEffect(.degrees(angle)).padding().background(.blue).tint(.black).animation(.easeIn, value: angle)

    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}

