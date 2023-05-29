//
//  AuthView.swift
//  CodeBytes
//
//  Created by Cole Peaden on 5/26/23.
//

import SwiftUI

struct AuthView: View {
  @Binding var currentViewShowing: String
    var body: some View {
      if (currentViewShowing == "login") {
        LoginView(currentViewShowing: $currentViewShowing)
          .preferredColorScheme(.light)
      } else {
        SignUpView(currentViewShowing: $currentViewShowing)
          .preferredColorScheme(.dark)
          .transition(.move(edge: .bottom))
      }
    }
}

#if DEBUG
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
      AuthView(currentViewShowing: .constant("login"))
    }
}
#endif
