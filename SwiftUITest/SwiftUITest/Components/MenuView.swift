//
//  MenuView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 28/09/22.
//

import SwiftUI

struct MenuView: View {

    @State private var current = 30.0
    @State private var max = 100.0
    @State private var min = 0.0

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ControlGroup {
            Text("Hello")

            Button(action: {}) {
                Label("Increase", systemImage: "user")
            }
        }
        CustomView {
            Text("CustomView")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
