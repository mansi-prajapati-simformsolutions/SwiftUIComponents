//
//  TaskView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 23/09/22.
//

import Foundation
import SwiftUI

struct TaskView: View {
    @Binding var path: NavigationPath
   // @State var isSelected = false
    @State private var isEditing = false
    @State private var showNextScreen = false
    @State private var showGridView = false

    var body: some View {
        VStack(spacing: 10) {
            ExtractedView(title: "ListView", destination: SpecialistView())
            ExtractedView(title: "Form", destination: FormView())
            ExtractedView(title: "GridView", destination: LazyHVGrid())
            ExtractedView(title: "TabView", destination: TabBarView())
            ExtractedView(title: "Stepper Toolbar", destination: StepperToolView())
           //ExtractedView(title: "UIViewControllerRepresentable", destination: MyView())
            ExtractedView(title: "Communication", destination: CommunicationView(observable: LoginViewObservable()))
           // ExtractedView(title: "Wrappers", destination: WrapperView())
          //  ExtractedView(title: "MapView", destination: MapView())
          //  ExtractedView(title: "PathView", destination: PathView())
            Button("back") {
                path.append(ViewValue.listView)
            }.navigationDestination(for: ViewValue.self) { val in
                //coordinator.navigate(val: val)
                switch(val) {
                case ViewValue.listView:
                    ViewThatFitsView(text: "Hello")
                case .taskView:
                    EmptyView()
                }
            }
            //ExtractedView(title: "View", destination: ViewThatFitsView())
           // ExtractedView(title: "AnyLayout", destination: AnyLayoutView())
            ExtractedView(title: "OnBoarding", destination: OnBoardingView())
            ExtractedView(title: "GridView", destination: GridView())
            //ExtractedView(title: "Navigation SplitView", destination: NavigationSplit())
            //ExtractedView(title: "TableView", destination: TableView())

        }.padding(.horizontal, 20)
    }
}

//struct TaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskView()
//    }
//}

struct ExtractedView <TargetView: View> : View {

    @State var isSelected = false
    var title: String
    var destination : TargetView

    var body: some View {
        Button(title) {
            isSelected = true
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(Color.darkTextColor)
        .cornerRadius(20)
        NavigationLink(destination: destination, isActive: $isSelected) {
            EmptyView()
        }
    }
}

//class TaskViewModel: ObservableObject {
//    @ObservedObject var path:
//}
