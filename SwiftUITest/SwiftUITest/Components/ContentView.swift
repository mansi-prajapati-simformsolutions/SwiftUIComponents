//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 21/09/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = LoginViewModel()
    @StateObject var coordinator = Coordinator()
    @State var isSelected = false
    @State private var email: String = "eve.holt@reqres.in"
    @State private var password: String = ""
    @State private var isSecured = false
    @State private var isEditing = false
    @State private var showNextScreen = false
    @State private var showGridView = false
    @State private var progress = 0.5
    @FocusState private var focusedField: FormField?
    @State private var responseText = ""

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack(alignment: .center, spacing: 20) {
                ScrollView {
                    Image("OnboardingHeader")
                    Text("Login")
                        .font(.custom("Montserrat-Bold", size: 25))
                        .foregroundColor(Color.darkTextColor).padding(.vertical, 10)

                    Text("Enter your login details to access your account").font(.custom("Montserrat-Medium", size: 12)).multilineTextAlignment(.center).padding(.horizontal, 100).foregroundColor(Color.background).padding(.bottom, 20)

                    VStack(alignment: .center, spacing: 20) {
                        HStack {
                            TextField(
                                "Enter email",
                                text: $email,
                                onEditingChanged: { editingChanged in
                                    if editingChanged {
                                        isEditing = true
                                    } else {
                                        isEditing = false
                                    }
                                }
                            ).darkMediumText().submitLabel(.next).focused($focusedField, equals: .email).accessibilityIdentifier("Email")
                            Image("EmailIcon")
                        }.padding(20).background(Color.white)
                            .cornerRadius(20)
                            .shadow(color:.shadowColor.opacity(0.2), radius: 7, x: 0, y: 0)

                        HStack {
                            if isSecured {
                                SecureField("Enter password", text: $password).darkMediumText().focused($focusedField, equals: .password).submitLabel(.done)
                            } else {
                                TextField("Enter password", text: $password).darkMediumText().focused($focusedField, equals: .password).submitLabel(.done)
                            }
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                    .accentColor(.darkTextColor)
                            }
                        }.padding(20).background(Color.white)
                            .cornerRadius(20)
                            .shadow(color:.shadowColor.opacity(0.2), radius: 7, x: 0, y: 0)
                    }.padding(.horizontal, 20)

                }.refreshable {
                    print("Pull")
                }.foregroundColor(.green)
                Spacer()
                HStack {
                    ProgressView("Loading...",value: progress, total: 1.0).foregroundColor(.background).tint(.background)
                    Button("LOG IN") {
                        print("Clicked")
                        isSelected = true
                        progress += 0.05

                        let uploadDataModel = UserData(email: email,password: password)
                        viewModel.signIn(url: "https://reqres.in/api/login", requestData: uploadDataModel)
//                        print("current state : \(viewModel.currentState)")
                        switch(viewModel.currentState) {
                        case .LOADING:
                            loaderView()
                        case .SUCCESS(users: let users):
                            responseText = users.token
                            print(users.token)
                        case .FAILURE(error: let error):
                            responseText = error
                            print(error)
                        default :
                            print("default")
                        }


                    }.accessibilityIdentifier("Login")
//                                        }.alert(responseText, isPresented: $isSelected) {
//                                            Button("OK", role: .cancel) {
                                            //}
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .foregroundColor(.white)
                        .background(Color.darkTextColor)
                        .cornerRadius(20)
                }.padding([.leading, .trailing] , 20)
                HStack {
                    Text("Don't have an account? ")
                        .foregroundColor(Color.background)
                    NavigationLink(destination: TaskView(path: $coordinator.path), isActive: $showNextScreen) {
                        EmptyView()
                    }
                    Text("Signup")
                        .underline()
                        .foregroundColor(.orange)
                        .onTapGesture {
                            showNextScreen = true
                            //$coordinator.path.wrappedValue.append(ViewValue.taskView)
                        }.navigationBarHidden(true)
                }
            }.onTapGesture {
                focusedField = nil
            } .onSubmit {
                switch focusedField {
                case .email:
                    focusedField = .password
                default:
                    focusedField = nil
                }
            }
        }
        .background(.background)
    }

    func loaderView() -> some View {
        ZStack {
            Color.black.opacity(0.05)
                .ignoresSafeArea()
            ProgressView()
                .scaleEffect(1, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        }
    }
}

enum constant {
    static let emailPlaceholder = "Enter Email"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum FormField {
    case email, password
}

enum ViewValue {
    case taskView
    case listView
}
