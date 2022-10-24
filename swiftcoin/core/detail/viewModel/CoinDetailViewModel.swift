//
//  CoinDetailViewModel.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 21/10/22.
//

import SwiftUI

class CoinDetailViewModel {
  
  private let coin: Coin
  var chartData = [ChartData]()
  var startDate = Date()
  var endDate = Date()
  var minPrice = 0.0
  var maxPrice = 0.0
  var xAxisValues = [Date]()
  var yAxisValues = [Double]()
  
  var coinName: String { coin.name }
  var chartLineColor: Color {
    let priceChange = (coin.sparklineIn7D.price.last ?? 0) - (coin.sparklineIn7D.price.first ?? 0)
    return priceChange > 0 ? .green : .red
  }

  var overviewSection: CoinDetailSection {
    let price = Statistic(
      title: "Current Price",
      value: coin.currentPrice.toCurrency(),
      percentageChange: coin.priceChangePercentage24H)
    let marketCap = Statistic(
      title: "Market Capitalisation",
      value: Double(coin.marketCap).formattingWithAbbreviations(),
      percentageChange: coin.marketCapChangePercentage24H)
    let rank = Statistic(
      title: "Rank",
      value: coin.marketCapRank.stringValue,
      percentageChange: nil)
    let volume = Statistic(
      title: "Volume",
      value: coin.totalVolume.formattingWithAbbreviations(),
      percentageChange: nil)
    return .init(title: "Overview", stats: [price, marketCap, rank, volume])
  }
  
  var additionalDetailsSection: CoinDetailSection {
    let high = Statistic(
      title: "24H High",
      value: coin.high24H.toCurrency(),
      percentageChange: nil)
    let low = Statistic(
      title: "24H Low",
      value: coin.low24H.toCurrency(),
      percentageChange: nil)
    let priceChange = Statistic(
      title: "24H Price Change",
      value: coin.priceChange24H.toCurrency(),
      percentageChange: coin.priceChangePercentage24H)
    let capChange = Statistic(
      title: "24H Market Cap Change",
      value: "$\(coin.marketCapChange24H.formattingWithAbbreviations())",
      percentageChange: coin.marketCapChangePercentage24H)
    return .init(title: "Additional Details", stats: [high, low, priceChange, capChange])
  }
  
  init(coin: Coin) {
    self.coin = coin
    self.configureChartData()
  }
  
  private func configureChartData() {
    let priceData = coin.sparklineIn7D
    var index = 0
    self.minPrice = priceData.price.min() ?? 0
    self.maxPrice = priceData.price.max() ?? 0
    self.endDate = Date(coinGeckoString: coin.lastUpdated)
    self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
    self.yAxisValues = [minPrice, (minPrice + maxPrice), maxPrice]
    self.xAxisValues = [startDate, endDate]

    for price in priceData.price.reversed() {
      let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
      let chartDataItem = ChartData(date: date, value: price)
      self.chartData.append(chartDataItem)
      index += 1
    }
  }
  
}
