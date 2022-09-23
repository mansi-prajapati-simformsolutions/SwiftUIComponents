//
//  StepperToolView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 26/09/22.
//

import Foundation
import SwiftUI

struct StepperToolView: View {
    @State var stepperValue: Int = 0
    @State private var sort: Int = 0
    @State private var email: String = ""
    @State private var showActionSheet = false
    @State private var isSelected = false
    @State private var isFullScreen = false
    @State private var isPopOver = false
    @State private var sliderValue = 0.0

    var body: some View {
        VStack {
            TextEditor(text: $email)
                .lineSpacing(10)
                .autocapitalization(.words)
                .disableAutocorrection(true)
                .padding().frame(width: 100, height: 100)

            Text("Current Slider Value: \(Int(sliderValue))")
            Slider(value: $sliderValue, in: 0...100, step: 2) {
                Text("Slider")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            }
            .padding()

            Text("hello").toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Image(systemName: "arrowshape.turn.up.backward").onTapGesture {
                        print("item 1 pressed")
                    }
                    Spacer()
                    Image(systemName: "person").onTapGesture {
                        print("item 2 pressed")
                    }
                    Spacer()
                    Menu {
                        Button("Duplicate", action: menuAction)
                        Button("Rename", action: menuAction)
                        Button("Delete", action: menuAction)
                        Menu {
                            Button("Copy", action: menuAction)
                            Button("Copy Formatted", action: menuAction)
                            Button("Copy Library Path", action: menuAction)
                        } label: {
                            Label("copy", systemImage: "arrowshape.turn.up.right")
                        }
                    } label: {
                        Label("", systemImage: "arrowshape.turn.up.right")
                    } primaryAction: {
                        print("menu pressed")
                    }
                }
            }
            TextField("Enter email", text: $email)
            Stepper("Stepper value: \(stepperValue)", value: $stepperValue, in: 0...10, step: 2)
            Button("sheet") {
                isSelected = true
            }
            .sheet(isPresented: $isSelected) {
                LazyHVGrid()
            }.buttonStyle(OutlineButtonStyle())

            Button("full screen") {
                isFullScreen = true
            }.buttonStyle(OutlineButtonStyle())
            .fullScreenCover(isPresented: $isFullScreen) {
                SpecialistView()
            }

            Button("Pop Over") {
                isPopOver = true
            }.popover(isPresented: $isPopOver) {
                MenuView()
            }.buttonStyle(OutlineButtonStyle())

            Button("Action Sheet") {
                showActionSheet = true
            }.buttonStyle(OutlineButtonStyle())
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Choose color"),
                            message: Text("Good morning"),
                            buttons: [
                                .cancel(),
                                .destructive(
                                    Text("Red"),
                                    action: menuAction
                                ),
                                .default(
                                    Text("Blue"),
                                    action: menuAction
                                )
                            ]
                )
            }
        }.padding()
    }

    func menuAction() {
        print("Menu action pressed")
    }
}

struct StepperToolView_Previews: PreviewProvider {
    static var previews: some View {
        StepperToolView()
    }
}

struct CustomButton : View {

    @State var isSelected = false
    var title: String

    var body: some View {
        Button(title) {
            isSelected = true
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(Color.darkTextColor)
        .cornerRadius(20)
    }
}
