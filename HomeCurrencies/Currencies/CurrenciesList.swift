//
//  CurrenciesList.swift
//  HomeCurrencies
//
//  Created by Monika Bk on 23/09/2023.
//

import SwiftUI

struct CurrenciesList: View {
    var rates: [Rate]
    
    var body: some View {
        List {
            ForEach(rates, id: \.code) { rate in
                NavigationLink {
                    DetailsView(rate: rate)
                } label: {
                    RateView(rate: rate)
                        .listRowInsets(EdgeInsets())
                }
            }
        }.listStyle(PlainListStyle())
    }
}

struct CurrenciesList_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesList(rates: [.default, .default])
    }
}
