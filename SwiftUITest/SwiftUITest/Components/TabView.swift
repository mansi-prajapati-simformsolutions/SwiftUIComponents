//
//  TabView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 23/09/22.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    var body: some View {
            TabView {
                SpecialistView().font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }

                Text("Bookmark Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "plus.rectangle.on.folder.fill").imageScale(.large)
                        Text("Bookmark")
                    }

                Text("Video Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "video.circle.fill")
                        Text("Video")
                    }

                Text("Profile Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
            }.accentColor(.background).navigationBarHidden(true)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
