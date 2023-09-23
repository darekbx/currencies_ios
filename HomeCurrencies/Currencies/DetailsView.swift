//
//  DetailsView.swift
//  HomeCurrencies
//
//  Created by Darek Barańczuk on 23/09/2023.
//

import SwiftUI

struct DetailsView: View {
    var rate: Rate
    
    var body: some View {
        VStack {
            Text(rate.currency)
                .font(.largeTitle)
            HStack {
                Text(rate.formattedValue)
                Text(rate.code)
                
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(rate: .default)
    }
}
