//
//  BaseTextField.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 27/09/22.
//

import Foundation
import SwiftUI

struct DarkMediumTextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
          .font(.custom("Montserrat-Medium", size: 15)).foregroundColor(.darkTextColor)
  }
}

extension View {
    func darkMediumText() -> some View {
      modifier(DarkMediumTextModifier())
    }
}
