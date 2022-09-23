//
//  AnyLayoutView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 03/10/22.
//

import SwiftUI

struct AnyLayoutView: View {

    @State private var isHorizontal = false

    var body: some View {
        let layout = isHorizontal ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())

        layout {
            Text("Hello")
            Text("World")
        }
        
        Button("Change") {
            withAnimation {
                isHorizontal.toggle()
            }
        }
    }
}

struct AnyLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        AnyLayoutView()
    }
}
