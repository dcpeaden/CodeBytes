//
//  LoginView.swift
//  CodeBytes
//
//  Created by Cole Peaden on 5/26/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
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
        Color.black.edgesIgnoringSafeArea(.all)

        VStack{
          HStack {
            Text("Create an Account")
              .font(.largeTitle)
              .bold()
              .foregroundColor(.white)
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
          )
          .padding()
          .foregroundColor(.white)

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
          .foregroundColor(.white)
          .padding()
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(lineWidth: 2)
          )
          .padding()
          .foregroundColor(.white)

          Button(action: {
            withAnimation {
              self.currentViewShowing = "login"
            }
          }) {
            Text("Already have an account?")
              .foregroundColor(.gray)
          }

          Spacer()
          Spacer()

          Button {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              if let error = error {
                print(error)
                return
              }

              if let authResult = authResult {
                print(authResult.user.uid)
              }
            }
          } label: {
            Text("Create Account")
              .foregroundColor(.black)
              .font(.title.bold())
              .frame(maxWidth: .infinity)
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .fill(Color.white)
              )
              .padding(.horizontal)
          }
        }
      }
      .preferredColorScheme(.dark)
    }
}
