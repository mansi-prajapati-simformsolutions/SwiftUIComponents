//
//  CommunicationView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 07/10/22.
//

import SwiftUI

class LoginViewObservable: ObservableObject {
    @Published var code: String = "Hello"
    var onLoginAction: (()->Void)!
}

struct CommunicationView: View {
    @ObservedObject var observable: LoginViewObservable

    var body: some View {
        VStack {
            TextField(
                "Enter email",
                text: $observable.code,
                onEditingChanged: { editingChanged in
                    $observable.code.wrappedValue = "ghghjg"
                })
            ExtractedView(title: "observe", destination: MyView(text: $observable.code))
        }
    }
}


struct CommunicationView_Previews: PreviewProvider {
    static var previews: some View {
        CommunicationView(observable: LoginViewObservable())
    }
}
