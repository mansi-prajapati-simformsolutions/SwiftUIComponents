//
//  DoctorModel.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 22/09/22.
//

import Foundation
import MapKit

class SpecialistDataModel: Identifiable {

    // MARK: - Variables
    var id = UUID()
    var category: String
    var name: String
    var image: String
    var detail: String

    // MARK: - Init
    init(category: String, activity: String, image: String, detail: String) {
        self.category = category
        self.name = activity
        self.image = image
        self.detail = detail
    }

    /// data for work details
    static let specialistData: [SpecialistDataModel] =  [SpecialistDataModel(category: "Physician", activity: "Svyatoslav Taushevt", image: "Jiminie", detail: "A physician is a medical doctor"),
                                                         SpecialistDataModel(category: "Doctor", activity: "Jimin Park", image: "Jimin", detail: "A physician is a medical doctor"),
                                                         SpecialistDataModel(category: "Physician", activity: "Kim Namjoon", image: "Jiminie", detail: "A physician is a medical doctor"),
                                                         SpecialistDataModel(category: "Physician", activity: "Jung Hoseok", image: "Jimin", detail: "A physician is a medical doctor"),SpecialistDataModel(category: "Physician", activity: "Jung Hoseok", image: "Jimin", detail: "A physician is a medical doctor"),SpecialistDataModel(category: "Physician", activity: "Jung Hoseok", image: "Jimin", detail: "A physician is a medical doctor"),SpecialistDataModel(category: "Physician", activity: "Jung Hoseok", image: "Jimin", detail: "A physician is a medical doctor"),SpecialistDataModel(category: "Physician", activity: "Jung Hoseok", image: "Jimin", detail: "A physician is a medical doctor"),SpecialistDataModel(category: "Physician", activity: "Jung Hoseok", image: "Jimin", detail: "A physician is a medical doctor"),SpecialistDataModel(category: "Physician", activity: "Jung Hoseok", image: "Jimin", detail: "A physician is a medical doctor. "),SpecialistDataModel(category: "Physician", activity: "Jung Hoseok", image: "Jimin", detail: "A physician is a medical doctor ")
    ]
}

struct CityModel: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D

    static let annotations = [
        CityModel(name: "Ahmedabad", coordinate: CLLocationCoordinate2D(latitude: 23.0225, longitude: 72.5714)),
        CityModel(name: "Vadodara", coordinate: CLLocationCoordinate2D(latitude: 22.3072, longitude: 73.1812)),
    ]
}

extension SpecialistDataModel: Hashable {
    static func == (lhs: SpecialistDataModel, rhs: SpecialistDataModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
//    static func == (lhs: SpecialistDataModel, rhs: SpecialistDataModel) -> Bool {
//        return lhs.name == rhs.name
//    }
}
