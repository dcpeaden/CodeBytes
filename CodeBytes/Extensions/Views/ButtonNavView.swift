//
//  ButtonNavView.swift
//  CodeBytes
//
//  Created by Cole Peaden on 5/28/23.
//

import SwiftUI

struct ButtonNavView: View {
  var text: String = ""
  var color: Color = .black
  var view: AnyView
    var body: some View {
      NavigationLink {
        view
      } label: {
        Text(text)
          .foregroundColor(.white)
          .font(.title.bold())
          .frame(maxWidth:.infinity)
          .frame(height: 50)
          .background(
            RoundedRectangle(cornerRadius: 10)
              .fill(color)
          )
      }
      .padding(.horizontal)
    }
}

#if DEBUG
struct ButtonNavView_Previews: PreviewProvider {
    static var previews: some View {
      ButtonNavView(
        text: "Sample",
        color: .blue,
        view: AnyView(LoginView(currentViewShowing: .constant("login")))
      )
    }
}
#endif
