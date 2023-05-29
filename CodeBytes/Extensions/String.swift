//
//  String.swift
//  CodeBytes
//
//  Created by Cole Peaden on 5/26/23.
//

import Foundation

extension String {
  func isValidEmail() -> Bool {
    let validEmailRegex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$", options: .caseInsensitive)
    return validEmailRegex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
  }
}
