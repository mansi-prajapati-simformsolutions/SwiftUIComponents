//
//  OutlineButtonStyle.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 30/09/22.
//

import SwiftUI

struct OutlineButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(configuration.isPressed ? RoundedRectangle(
                cornerRadius: 8,
                style: .continuous
            ).stroke(Color.green).background(Color.white) : RoundedRectangle(
                cornerRadius: 8,
                style: .continuous
            ).stroke(Color.black).background(Color.background))

    }
}

