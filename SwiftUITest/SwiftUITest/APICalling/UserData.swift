//
//  UserData.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 04/10/22.
//

import Foundation

struct UserData: Codable {
    var email: String
    var password: String
}

struct SignInResponse: Codable {
    var token: String
}

struct SignUpResponse: Codable {
    var id: Int
    var token: String
}

struct ErrorResponse: Decodable {
    var error: String
}

struct SignupModel: Codable {
    var name: String
    var email: String
    var password: String
}
