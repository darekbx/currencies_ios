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
            VStack(spacing: 5) {
                if let data = viewModel.currencies {
                    
                    Text("Currencies")
                        .font(.largeTitle)
                
                    HStack {
                        TextField("Filter", text: $filter)
                        Button {
                            viewModel.refreshSync()
                        } label: {
                            Image(systemName: "arrow.clockwise.circle.fill")
                        }
                    }
                    .padding()
                    
                    CurrenciesList(rates: data.rates.filter {
                        filter.isEmpty || $0.currency.contains(filter.lowercased())
                    })
                } else {
                    ProgressView("Loading...")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
