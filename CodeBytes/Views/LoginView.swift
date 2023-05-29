//
//  LoginView.swift
//  CodeBytes
//
//  Created by Cole Peaden on 5/26/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
  @State var email: String = ""
  @State var password: String = ""
  @Binding var currentViewShowing: String

  private func isValidPassword(_ password: String) -> Bool {
    // Min Length = 8 chars
    // 1 Special, 1 Upper and lower, and 1 number
    let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$")
    return passwordRegex.evaluate(with: password)
  }

    var body: some View {
      ZStack {
        Color.white.edgesIgnoringSafeArea(.all)

        VStack{
          HStack {
            Text("Welcome Back!")
              .font(.largeTitle)
              .bold()
          }
          .padding()
          Spacer()

          HStack {
            Image(systemName: "mail")
            TextField("Email", text: $email)
            Spacer()

            if (email.count > 0) {
              Image(systemName: email.isValidEmail()
                    ? "checkmark"
                    : "xmark")
                .fontWeight(.bold)
                .foregroundColor(email.isValidEmail()
                  ? .green
                  : .red)
            }
          }
          .padding()
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(lineWidth: 2)
              .foregroundColor(.black)
          )
          .padding()

          HStack {
            Image(systemName: "lock")
            SecureField("Password", text: $password)
            Spacer()
            if (password.count > 0) {
              Image(systemName: isValidPassword(password)
                    ? "checkmark"
                    : "xmark")
                .fontWeight(.bold)
                .foregroundColor(isValidPassword(password)
                    ? .green
                    : .red)
            }
          }
          .padding()
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(lineWidth: 2)
              .foregroundColor(.black)
          )
          .padding()

          Button(action: {
            withAnimation {
              self.currentViewShowing = "signup"
            }
          }) {
            Text("Don't have an account?")
              .foregroundColor(.black.opacity(0.7))
          }

          Spacer()
          Spacer()

          Button {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
              if let error = error {
                print(error)
                return
              }

              if let authResult = authResult {
                print(authResult.user.uid)
              }
            }
          } label: {
            Text("Sign In")
              .foregroundColor(.white)
              .font(.title.bold())
              .frame(maxWidth: .infinity)
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .fill(Color.black)
              )
              .padding(.horizontal)
          }
        }
      }
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
          currentViewShowing: .constant("login")
        )
    }
}
#endif
