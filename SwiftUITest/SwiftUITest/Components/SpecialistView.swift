//
//  DetailView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 21/09/22.
//

import SwiftUI

struct SpecialistView: View {
    var specialistData: [SpecialistDataModel] = SpecialistDataModel.specialistData
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            VStack {
                List(searchResults, id: \.id) { item in
                    VStack {
                        NavigationLink(value: item) {
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
                                    .lineLimit(4)
                                    .minimumScaleFactor(0.5)
                                    .font(.custom("Montserrat-Bold", size: 12))
                                    .foregroundColor(.darkTextColor)
                            }.padding(.leading, 20)
                        }
                    }
                }.listStyle(.plain).navigationDestination(for: SpecialistDataModel.self) { item in
                    DoctorDetailsView(doctorData: item)
                }.searchable(text: $searchText).refreshable {
                    print("refresh")
                }.background(.background)
                Spacer()
            }.navigationBarTitle("", displayMode: .inline).edgesIgnoringSafeArea(.vertical).navigationBarHidden(false).padding(.top, 20)
        }
    }

    var searchResults: [SpecialistDataModel] {
           if searchText.isEmpty {
               return specialistData
           } else {
               return specialistData.filter { $0.name.contains(searchText.description.lowercased()) || $0.category.contains(searchText.description.lowercased()) || $0.detail.contains(searchText.description.lowercased())}
           }
       }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistView()
    }
}
