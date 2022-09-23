//
//  LoginViewModel.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 04/10/22.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var currentState: ViewState = .START
    var result: ((Bool) -> Void)?
    
    func signIn(url: String,requestData: UserData) {
        guard let jsonData = try? JSONEncoder().encode(requestData) else {
            return
        }
        self.currentState = .LOADING
        ApiManager.request(url: url, method: "POST",requestData: jsonData, responseClass: SignInResponse.self, responseCode: 200,onSuccess: { response in
            self.currentState = .SUCCESS(users: response)
        }, onFailure: { error in
            self.currentState = .FAILURE(error: error.error.description)
        })
        
    }
}

enum ViewState {
    case START
    case LOADING
    case SUCCESS(users: SignInResponse)
    case FAILURE(error: String)
}
