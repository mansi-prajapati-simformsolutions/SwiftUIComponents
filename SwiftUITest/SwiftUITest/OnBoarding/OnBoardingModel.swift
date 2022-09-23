//
//  OnBoardingModel.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 10/10/22.
//

import Foundation

class OnboradingModel: Identifiable {

    // MARK: - Variables
    var id = UUID()
    var titles: String
    var descriptions: String
    var onBoardingImages: String

    // MARK: - init
    init(title: String, description: String, onBoardingImage: String) {
        titles = title
        descriptions = description
        onBoardingImages = onBoardingImage
    }

    /// data for onboarding
    static let onboardingData = [OnboradingModel(title: "Welcome to Amegreen\n HealthCare Solution", description: "We're a leading provider of person-centred, \nnurse-led complex healthcare \nin the home, and have been since 1996", onBoardingImage: "Doctor"), OnboradingModel(title: "Welcome to Amegreen\n HealthCare Solution", description: "We're a leading provider of person-centred, \nnurse-led complex healthcare \nin the home, and have been since 1996", onBoardingImage: "Doctor"), OnboradingModel(title: "Welcome to Amegreen\n HealthCare Solution", description: "We're a leading provider of person-centred, \nnurse-led complex healthcare \nin the home, and have been since 1996", onBoardingImage: "Doctor"), OnboradingModel(title: "Welcome to Amegreen\n HealthCare Solution", description: "We're a leading provider of person-centred, \nnurse-led complex healthcare \nin the home, and have been since 1996", onBoardingImage: "Doctor"), OnboradingModel(title: "Welcome to Amegreen\n HealthCare Solution", description: "We're a leading provider of person-centred, \nnurse-led complex healthcare \nin the home, and have been since 1998", onBoardingImage: "Doctor")]
}
