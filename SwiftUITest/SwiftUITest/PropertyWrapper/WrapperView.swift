//
//  WrapperView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 27/09/22.
//

import SwiftUI

struct WrapperView: View {

    var body: some View {
        VStack(spacing: 10) {
            ExtractedView(title: "state binding wrapper", destination: StateView())
            ExtractedView(title: "Published StateObserved", destination: PublishStateObserved())
            ExtractedView(title: "Environment", destination: EnvironmentView())
            ExtractedView(title: "Environment Object", destination: EnvironmentObjectView())
            ExtractedView(title: "Custom Wrapper", destination: Custom())
        }.padding(.horizontal, 20)
    }
}

struct WrapperView_Previews: PreviewProvider {
    static var previews: some View {
        WrapperView()
    }
}
