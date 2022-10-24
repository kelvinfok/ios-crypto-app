//
//  TopMoversView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 20/10/22.
//

import SwiftUI

struct TopMoversView: View {
  
  @StateObject var viewModel: HomeViewModel
  
    var body: some View {
      VStack(alignment: .leading) {
        Text("Top Movers")
          .font(.headline)
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 16) {
            ForEach(viewModel.topMovingCoins) { coin in
              NavigationLink {                
                LazyNavigationView(
                  CoinDetailView(coin: coin)
                )
              } label: {
                TopMoversItemView(coin: coin)
              }
            }
          }
        }
      }
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
      TopMoversView(viewModel: .init())
    }
}
