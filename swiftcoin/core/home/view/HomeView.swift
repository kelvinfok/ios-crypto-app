//
//  HomeView.swift
//  swiftcoin
//
//  Created by Kelvin Fok on 20/10/22.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject var viewModel = HomeViewModel()
  
  var body: some View {
    NavigationView {
      ZStack {
        ScrollView(.vertical, showsIndicators: false) {
          TopMoversView(viewModel: viewModel)
            .padding()
          Divider()
          AllCoinsView(viewModel: viewModel)
        }
        if viewModel.isLoadingData {
          CustomLoadingIndicator()
        }
      }.navigationTitle("Live Prices")
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
