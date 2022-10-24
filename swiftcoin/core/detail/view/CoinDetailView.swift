//
//  CoinDetailView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 21/10/22.
//

import SwiftUI

struct CoinDetailView: View {
  
  let viewModel: CoinDetailViewModel
  
  init(coin: Coin) {
    self.viewModel = CoinDetailViewModel(coin: coin)
  }
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      // chart
      ChartView(viewModel: viewModel)
        .frame(height: 240)
        .padding(.vertical)
      // overview
      CoinDetailSectionView(model: viewModel.overviewSection)
        .padding(.vertical)
      // additional details
      CoinDetailSectionView(model: viewModel.additionalDetailsSection)
        .padding(.vertical)
    }
    .padding()
    .navigationTitle(viewModel.coinName)
  }
}

struct CoinDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CoinDetailView(coin: dev.coin)
  }
}
