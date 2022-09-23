//
//  LazyHVGrid.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 23/09/22.
//

import Foundation
import SwiftUI

struct LazyHVGrid: View {

    var specialistData: [SpecialistDataModel] = SpecialistDataModel.specialistData

    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, alignment: .center) {
                    ForEach(specialistData, id: \.id) { item in
                        VStack(alignment: .center, spacing: 5) {
                        Image(item.image)
                            .resizable().frame(width: 50, height: 50)
                            .scaledToFill()
                            .padding(.trailing, 10)
                            Text(item.category)
                                .font(.custom("Montserrat-Medium", size: 12))
                                .foregroundColor(.darkTextColor)
                            Text(item.name)
                                .font(.custom("Montserrat-Bold", size: 15))
                                .foregroundColor(.darkTextColor)
                            Text(item.detail)
                                .lineLimit(4)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .font(.custom("Montserrat-Bold", size: 12))
                                .foregroundColor(.darkTextColor)
                        }
                    }
                }
            }

            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(200))], spacing: 20) {
                    ForEach(specialistData, id: \.id) { item in
                        Image(item.image)
                            .resizable().frame(width: 50, height: 50)
                            .scaledToFill()
                            .padding(.trailing, 10)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.category)
                                .font(.custom("Montserrat-Medium", size: 12))
                                .foregroundColor(.darkTextColor)
                            Text(item.name)
                                .font(.custom("Montserrat-Bold", size: 15))
                                .foregroundColor(.darkTextColor)
                            Text(item.detail)
                                .minimumScaleFactor(0.5)
                                .font(.custom("Montserrat-Bold", size: 12))
                                .foregroundColor(.darkTextColor)
                        }
                    }
                }
            }
        }
    }
}

struct LazyHVGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyHVGrid()
    }
}
