//
//  LazyNavigationView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 24/10/22.
//

import SwiftUI

struct LazyNavigationView<Content: View>: View {
  let build: () -> Content
  
  init(_ build: @autoclosure @escaping() -> Content) {
    self.build = build
  }
  
  var body: Content {
    build()
  }
}
