//
//  SwiftUIView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 03/10/22.
//

import SwiftUI

struct NavigationSplit: View {
    @State private var data = SpecialistDataModel.specialistData
    @State private var selection: SpecialistDataModel?

        var body: some View {
            NavigationSplitView {
                List(data, selection: $selection) { item in
                    Text(item.name).tag(item)
                }
            } detail: {
                Text(selection?.name ?? "Mansi")

            }
            .navigationSplitViewStyle(.balanced)
        }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplit()
    }
}
