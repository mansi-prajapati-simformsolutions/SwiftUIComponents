//
//  EnvironmentObject.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 27/09/22.
//

import SwiftUI

struct EnvironmentObjectView: View {

    @StateObject var progress = UserProgress()

    var body: some View {
        VStack(alignment: .center) {
            Text("\(progress.score)")
                .padding()
                .font(.title)
            Button {
                progress.score += 1
            } label: {
                Text("Add")
            }
            .tint(.red)
            SecondView()
        }
        .padding(50)
        .environmentObject(progress)
    }
}

struct SecondView: View {

    @EnvironmentObject var progress: UserProgress

    var body: some View {
        HStack {
            Text("\(progress.score)")
            .font(.title)
            .foregroundColor(.white)
            ThirdView()
        }.padding()
        .background {
            Color.blue
        }
    }
}

struct ThirdView: View {

    @EnvironmentObject var progress: UserProgress

    var body: some View {
        VStack {
            Text("\(progress.score)")
                .font(.title)
                .foregroundColor(.white)
        }.background(.brown)
    }
}

struct BlackView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
