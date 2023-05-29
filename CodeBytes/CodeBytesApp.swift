//
//  CodeBytesApp.swift
//  CodeBytes
//
//  Created by Cole Peaden on 5/26/23.
//

import SwiftUI
import FirebaseCore

@main
struct CodeBytesApp: App {

  init() {
    FirebaseApp.configure()
  }

  var body: some Scene {
      WindowGroup {
          ContentView()
      }
  }
}
