//
//  AllCoinsView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 21/10/22.
//

import SwiftUI

struct AllCoinsView: View {
  
  @StateObject var viewModel: HomeViewModel

    var body: some View {
      VStack(alignment: .leading) {
        Text("All Coins")
          .font(.headline)
          .padding()
        HStack {
          Text("Coin")
          Spacer()
          Text("Prices")
        }
        .foregroundColor(.gray)
        .font(.caption)
        .padding(.horizontal)
        ScrollView {
          VStack {
            ForEach(viewModel.coins) { coin in
              NavigationLink {
                LazyNavigationView(
                  CoinDetailView(coin: coin)
                )
              } label: {
                CoinRowView(coin: coin)
                  .padding(.horizontal)
                  .padding(.vertical, 4)
              }
            }
          }
        }
      }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
      AllCoinsView(viewModel: .init())
    }
}
