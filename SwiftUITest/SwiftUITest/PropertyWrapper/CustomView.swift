//
//  CustomView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 28/09/22.
//

import SwiftUI

struct CustomView <Content: View> : View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
                .padding()
                .background(.cyan)
                .cornerRadius(20)
                .foregroundColor(.white)

            Button("OK", role: .destructive) {
                print("ok clicked")
            }
        }.padding(30).background(.gray)
    }
}

