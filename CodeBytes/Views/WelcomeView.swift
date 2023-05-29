//
//  WelcomeView.swift
//  CodeBytes
//
//  Created by Cole Peaden on 5/28/23.
//

import SwiftUI

struct WelcomeView: View {
  @State private var currentViewShowing: String = "login"
    var body: some View {
      NavigationView {
        VStack {
          Spacer()
          Text("CodeBytes")
            .font(.largeTitle.bold())
          Spacer()
          ButtonNavView(
            text: "Sign In",
            color: .black,
            view: AnyView(LoginView(currentViewShowing: $currentViewShowing))
          )

          ButtonNavView(
            text: "Create Account",
            color: .blue,
            view: AnyView(SignUpView(currentViewShowing: $currentViewShowing))
          )
        }
      }
      .preferredColorScheme(.light)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
