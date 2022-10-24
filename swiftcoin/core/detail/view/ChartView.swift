//
//  ChartView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 22/10/22.
//

import SwiftUI
import Charts

struct ChartView: View {
  let viewModel: CoinDetailViewModel
  
  var body: some View {
    Chart {
      ForEach(viewModel.chartData) { item in
        LineMark(x: .value("Date", item.date),
                 y: .value("Price", item.value)
        )
        .interpolationMethod(.cardinal)
        .foregroundStyle(viewModel.chartLineColor)
      }
    }
    .chartXScale(domain: ClosedRange(
      uncheckedBounds: (lower: viewModel.startDate, upper: viewModel.endDate)))
    .chartXAxis {
      AxisMarks(position: .bottom, values: viewModel.xAxisValues) { value in
        AxisGridLine()
        AxisValueLabel() {
          if let dateValue = value.as(Date.self) {
            Text(dateValue.asShortDateString())
          }
        }
      }
    }
    .chartYScale(domain: ClosedRange(
      uncheckedBounds: (lower: viewModel.minPrice, upper: viewModel.maxPrice)))
    .chartYAxis {
      AxisMarks(position: .leading, values: viewModel.yAxisValues) { value in
        AxisGridLine()
        AxisValueLabel() {
          if let doubleValue = value.as(Double.self) {
            Text(doubleValue.formattingWithAbbreviations())
          }
        }
      }
    }
  }
}

struct ChartView_Previews: PreviewProvider {
  static var previews: some View {
    ChartView(viewModel: .init(coin: dev.coin))
  }
}
