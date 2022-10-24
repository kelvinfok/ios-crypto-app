//
//  StatisticView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 21/10/22.
//

import SwiftUI

struct StatisticView: View {
  
  let model: Statistic
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(model.title)
        .font(.caption)
      Text(model.value)
        .font(.headline)
      if let percentageChange = model.percentageChange {
        HStack(spacing: 4) {
          Image(systemName: "triangle.fill")
            .font(.caption)
          Text(percentageChange.toPercentageString())
            .font(.caption).bold()
        }
        .foregroundColor(.green)
      }
    }
  }
}

struct StatisticView_Previews: PreviewProvider {
  static var previews: some View {
    StatisticView(model: dev.stat1)
  }
}
