//
//  ChartData.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 22/10/22.
//

import Foundation

struct ChartData: Identifiable {
  let id: String = UUID().uuidString
  let date: Date
  let value: Double
}
