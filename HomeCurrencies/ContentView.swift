//
//  ContentView.swift
//  HomeCurrencies
//
//  Created by Darek Barańczuk on 22/09/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CurrenciesViewModel()
    @State var filter = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let data = viewModel.currencies {
                    List {
                        TextField("Filter", text: $filter)
                        ForEach(data.rates.filter { filter.isEmpty || $0.currency.contains(filter.lowercased()) }, id: \.code) { rate in
                            NavigationLink {
                                DetailsView(rate: rate)
                            } label: {
                                RateView(rate: rate)
                            }
                        }
                    }
                } else {
                    Text("Failed...")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
