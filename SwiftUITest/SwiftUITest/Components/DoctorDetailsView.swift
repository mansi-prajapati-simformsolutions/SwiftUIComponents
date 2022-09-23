//
//  DoctorDetailsView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 22/09/22.
//

import SwiftUI

struct DoctorDetailsView: View {
    
    var doctorData: SpecialistDataModel
    @State private var showNextScreen = false

    var body: some View {
        VStack {
            Image(doctorData.image)
                .resizable().frame(width: 100, height: 100)
                .scaledToFill()
                .padding(.trailing, 10)
            Text(doctorData.category)
                .font(.custom("Montserrat-Medium", size: 12))
                .foregroundColor(.darkTextColor)
            Text(doctorData.name)
                .font(.custom("Montserrat-Bold", size: 15))
                .foregroundColor(.darkTextColor)
            Text(doctorData.detail)
                .lineLimit(5)
                .minimumScaleFactor(0.5)
                .font(.custom("Montserrat-Bold", size: 12))
                .foregroundColor(.darkTextColor)
            NavigationLink(destination: FormView(), isActive: $showNextScreen) {
                EmptyView()
            }

            Text("Form")
                .underline()
                .foregroundColor(.blue)
                .onTapGesture {
                    showNextScreen = true
                }.padding(.top, 10)
        }.padding()
        Spacer()
    }

}

struct DoctorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailsView(doctorData: SpecialistDataModel.specialistData.first!)
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

struct FormView: View {
    var options = ["One", "Two", "Three"]
    @State private var selectedOption = "One"
    @State var username: String = ""
    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    @State private var date = Date()
    var previewOptions = ["Always", "When Unlocked"]

    var body: some View {
       Form {
            Section(header: Text("PROFILE")) {
                TextField("Username", text: $username)
                Toggle(isOn: $isPrivate) {
                    Text("Private Account")
                }
            }

            Section(header: Text("NOTIFICATIONS")) {
                Toggle(isOn: $notificationsEnabled) {
                    Text("Enabled")
                }

                Picker("Select", selection: $selectedOption) {
                    ForEach(options, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.segmented)
                Text("Value: \(selectedOption)")
            }

            Section {
                DatePicker("Pick a date", selection: $date, displayedComponents: [.date])
                    .padding().accentColor(Color.background)
            }

            Section(header: Text("ABOUT")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("2.2.1")
                }
            }
        }.navigationBarTitle("Settings")
    }
}
