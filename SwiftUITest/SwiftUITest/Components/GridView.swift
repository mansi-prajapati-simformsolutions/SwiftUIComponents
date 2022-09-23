//
//  GridView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 03/10/22.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid {
            GridRow {
                ForEach(0..<4) {_ in
                    CustomColorButton(color: .blue)
                }
            }
            Divider()
            GridRow {
                ForEach(0..<3) {_ in
                    CustomColorButton(color: .pink)
                }
            }

//            ViewThatFitsView(text: "Park Jimin")
//            ViewThatFitsView(text: "Park Jimin, kim namjoon, kim taehyung")
            }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
