//
//  HomeViewModel.swift
//  swiftcoin
//

import SwiftUI

class HomeViewModel: ObservableObject {
  
  @Published var coins = [Coin]()
  @Published var topMovingCoins = [Coin]()
  @Published var isLoadingData = true
  
  init() {
    fetchCoinData()
  }
  
  func fetchCoinData() {
  let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
    let url = URL(string: urlString)!
    URLSession.shared.dataTask(with: url) { [unowned self] data, response, error in
      DispatchQueue.main.async {
        self.isLoadingData = false
        self.coins = try! JSONDecoder().decode([Coin].self, from: data!)
        self.configureTopMovingCoins()
      }
    }.resume()
  }
  
  func configureTopMovingCoins() {
    let topMovers: [Coin] = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
    self.topMovingCoins = Array(topMovers.prefix(5))
  }
}
