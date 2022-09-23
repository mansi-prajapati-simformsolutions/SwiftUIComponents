//
//  TableView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 04/10/22.
//

import SwiftUI

struct TableView: View {

    private var doctorData = SpecialistDataModel.specialistData
    var body: some View {
        Table(doctorData) {
            TableColumn("name", value: \.name)
            TableColumn("category", value: \.category)
            TableColumn("detail", value: \.detail)
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
