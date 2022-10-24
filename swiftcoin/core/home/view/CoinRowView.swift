//
//  CoinRowView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 21/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CoinRowView: View {
  
  let coin: Coin
  
  var body: some View {
    HStack {
      Text(coin.marketCapRank.stringValue)
        .font(.caption)
        .foregroundColor(.gray)
      
      WebImage(url: .init(string: coin.image))
        .resizable()
        .scaledToFit()
        .frame(width: 32, height: 32)
        .foregroundColor(.orange)
      
      VStack(alignment: .leading, spacing: 4) {
        Text(coin.name)
          .font(.subheadline)
          .fontWeight(.semibold)
          .padding(.leading, 4)
        Text(coin.symbol)
          .font(.caption)
          .padding(.leading, 6)
      }
      .foregroundColor(Color.theme.primaryTextColor)
      .padding(.leading, 2)
      
      Spacer()
      
      VStack(alignment: .trailing, spacing: 4) {
        Text(coin.currentPrice.toCurrency())
          .font(.subheadline)
          .fontWeight(.semibold)
          .padding(.leading, 4)
        Text(coin.priceChangePercentage24HInCurrency.toCurrency())
          .font(.caption)
          .padding(.leading, 6)
          .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
      }
      .padding(.leading, 2)
    }
  }
}

//struct CoinRowView_Previews: PreviewProvider {
//  static var previews: some View {
//    CoinRowView(coin: <#Coin#>)
//  }
//}
