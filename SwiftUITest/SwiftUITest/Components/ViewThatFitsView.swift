//
//  ViewThatFitsViewswift.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 04/10/22.
//

import SwiftUI

struct ViewThatFitsView: View {
    var text: String
    var body: some View {
        ViewThatFits {
            HStack {
                Text(text)
                .padding(.leading)
                Button(action: {}) {
                        Text("Cancel").frame(maxWidth: .infinity)
                }.padding(.trailing)
            }.frame(maxHeight: 100)
         
            VStack {
                Text(text)
                Button(action: {}) {
                        Text("Cancel").frame(maxWidth: .infinity)
                    }.padding(.horizontal)
            }.frame(maxHeight: 200)
        }
    }
}

//struct ViewThatFitsViewswift_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewThatFitsView()
//    }
//}
