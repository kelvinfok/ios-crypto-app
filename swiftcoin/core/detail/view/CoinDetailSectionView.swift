//
//  CoinDetailSectionView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 21/10/22.
//

import SwiftUI

struct CoinDetailSectionView: View {

  let model: CoinDetailSection
  
  private let columns: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible()),
  ]
  
  var body: some View {
    VStack {
      Text(model.title)
        .font(.title).bold()
        .frame(maxWidth: .infinity, alignment: .leading)
      LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
        ForEach(model.stats) { stat in
          StatisticView(model: stat)
        }
      }
    }
  }
}

struct CoinDetailSectionView_Previews: PreviewProvider {
  static var previews: some View {
    CoinDetailSectionView(model: dev.sectionModel)
  }
}
