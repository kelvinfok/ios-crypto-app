//
//  Coin.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 21/10/22.
//

import Foundation

struct Coin: Decodable, Identifiable {
  let id, symbol, name: String
  let image: String
  let currentPrice: Double
  let marketCap, marketCapRank: Int
  let fullyDilutedValuation: Int?
  let totalVolume, high24H, low24H, priceChange24H: Double
  let priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double
  let totalSupply, maxSupply: Double?
  let ath, athChangePercentage: Double
  let athDate: String
  let atl, atlChangePercentage: Double
  let sparklineIn7D: SparklineIn7D
  let atlDate: String
  let lastUpdated: String
  let priceChangePercentage24HInCurrency: Double
  
  enum CodingKeys: String, CodingKey {
    case id, symbol, name, image
    case sparklineIn7D = "sparkline_in_7d"
    case currentPrice = "current_price"
    case marketCap = "market_cap"
    case marketCapRank = "market_cap_rank"
    case fullyDilutedValuation = "fully_diluted_valuation"
    case totalVolume = "total_volume"
    case high24H = "high_24h"
    case low24H = "low_24h"
    case priceChange24H = "price_change_24h"
    case priceChangePercentage24H = "price_change_percentage_24h"
    case marketCapChange24H = "market_cap_change_24h"
    case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
    case circulatingSupply = "circulating_supply"
    case totalSupply = "total_supply"
    case maxSupply = "max_supply"
    case ath
    case athChangePercentage = "ath_change_percentage"
    case athDate = "ath_date"
    case atl
    case atlChangePercentage = "atl_change_percentage"
    case atlDate = "atl_date"
    case lastUpdated = "last_updated"
    case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
  }
}

struct SparklineIn7D: Decodable {
  let price: [Double]
}
