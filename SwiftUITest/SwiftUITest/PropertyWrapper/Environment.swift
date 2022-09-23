//
//  Environment.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 27/09/22.
//

import SwiftUI

struct EnvView: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        if colorScheme == .dark {
            VStack {
                Text("Alice")
                Text("Bob")
            }
        } else {
            HStack {
                Text("Alice")
                Text("Bob")
            }
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView().preferredColorScheme(.dark)
    }
}

struct EnvironmentView: View {
    var body: some View {
        VStack(spacing: 20) {
            EnvView().environment(\.colorScheme, .dark)
            EnvView().environment(\.colorScheme, .light)
        }
    }
}
