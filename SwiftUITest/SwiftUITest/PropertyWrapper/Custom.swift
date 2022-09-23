//
//  Custom.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 27/09/22.
//

import SwiftUI

@propertyWrapper
struct CustomProperty: DynamicProperty {
    @State private var value = 0

    var wrappedValue: Int {
        get {
            return value
        }

        nonmutating set {
            value = newValue
        }
    }
}

struct Custom: View {
    @CustomProperty var customProperty
    var body: some View {
        Text("value \(customProperty)")
        Button("Add") {
            customProperty += 1
        }
    }
}

struct Custom_Previews: PreviewProvider {
    static var previews: some View {
        Custom()
    }
}
