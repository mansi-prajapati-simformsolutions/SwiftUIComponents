//
//  PublishStateObserved.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 27/09/22.
//

import SwiftUI

class UserProgress: ObservableObject {
    @Published var score = 0
}

struct PublishStateObserved: View {
    @StateObject var progress = UserProgress()

    var body: some View {
        VStack {
            Text("Your score is \(progress.score)")
            InnerView(progress: progress)
        }
    }
}

struct InnerView: View {
    @ObservedObject var progress: UserProgress

    var body: some View {
        Button("Increase Score") {
            progress.score += 1
        }
        Inner2View(progress: progress)
    }
}

struct Inner2View: View {
    @ObservedObject var progress: UserProgress

    var body: some View {
        Button("Increase Score") {
            progress.score += 2
        }
    }
}

struct PublishStateObserved_Previews: PreviewProvider {
    static var previews: some View {
        PublishStateObserved()
    }
}
