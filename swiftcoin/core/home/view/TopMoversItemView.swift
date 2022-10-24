//
//  TopMoversItemView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 20/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopMoversItemView: View {
  
  let coin: Coin
  
  var body: some View {
    VStack(alignment: .leading) {
      WebImage(url: .init(string: coin.image))
        .resizable()
        .frame(width: 32, height: 32)
        .foregroundColor(.orange)
        .padding(.bottom, 8)
      HStack(spacing: 2) {
        Text(coin.symbol.uppercased())
          .font(.caption)
          .fontWeight(.bold)
          .foregroundColor(Color.theme.primaryTextColor)
        Text(coin.currentPrice.toCurrency())
          .font(.caption)
          .foregroundColor(.gray)
      }
      Text(coin.priceChangePercentage24H.toPercentageString())
        .font(.title2)
        .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
    }
    .frame(width: 140, height: 140)
    .background(Color.theme.itemBackgroundColor)
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color(.systemGray4), lineWidth: 2)
    )
  }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//  static var previews: some View {
//    TopMoversItemView(coin: <#Coin#>)
//  }
//}
