//
//  Extension+Double.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 21/10/22.
//

import Foundation

extension Double {
  
  private var currencyFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.usesGroupingSeparator = true
    formatter.numberStyle = .currency
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    return formatter
  }
  
  private var numberFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    return formatter
  }
  
  func toCurrency() -> String {
    currencyFormatter.string(for: self)!
  }
  
  func toPercentageString() -> String {
    return numberFormatter.string(for: self)! + "%"
  }
  
  func asNumberString() -> String {
    return String(format: "%.2f", self)
  }
  
  func toString() -> String {
    return String(describing: self)
  }
  
  func formattingWithAbbreviations() -> String {
    let num = abs(self)
    let sign = (self < 0) ? "-" : ""
    switch num {
    case 1_000_000_000_000...:
      let formatted = num / 1_000_000_000_000
      let string = formatted.asNumberString()
      return String(format: "%@%@Tr", sign, string)
    case 1_000_000_000...:
      let formatted = num / 1_000_000_000
      let string = formatted.asNumberString()
      return String(format: "%@%@Bn", sign, string)
    case 1_000_000...:
      let formatted = num / 1_000_000
      let string = formatted.asNumberString()
      return String(format: "%@%@M", sign, string)
    case 1_000...:
      let formatted = num / 1_000_000
      let string = formatted.asNumberString()
      return String(format: "%@%@K", sign, string)
    case 0:
      return self.asNumberString()
    default: return ""
    }
  }
}
