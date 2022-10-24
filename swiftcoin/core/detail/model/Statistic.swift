//
//  Statistic.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 21/10/22.
//

import Foundation

struct Statistic: Identifiable {
  let id = UUID().uuidString
  let title: String
  let value: String
  let percentageChange: Double?
}
