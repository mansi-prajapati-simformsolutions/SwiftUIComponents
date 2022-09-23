//
//  Coordinator.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 04/10/22.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    func gotoHomePage() {
        path.removeLast(path.count)
    }

    func tapOnEnter() {
        path.append(1)
    }

    func tapOnFirstPage() {
        path.append(2)
    }

    func tapOnSecondPage() {
        path.removeLast()
    }

//    @ViewBuilder func navigate(val: ViewValue) -> some View {
//        switch(val) {
//        case ViewValue.taskView:
//            TaskView(path: $path)
//        case ViewValue.listView:
//          ViewThatFitsView(text: "Hello")
//        default:
//            EmptyView()
//        }
//    }
}

