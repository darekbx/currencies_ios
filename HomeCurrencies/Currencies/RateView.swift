//
//  RateView.swift
//  HomeCurrencies
//
//  Created by Darek Barańczuk on 22/09/2023.
//

import SwiftUI

struct RateView: View {
    var rate: Rate
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Text("\(rate.formattedValue)")
                    .bold()
                    .padding(.trailing, 2)
            Text("\(rate.code)")
                .fontWeight(.light)
            
            Spacer()
            
            Text("\(rate.currency)")
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.gray)
        }
        .font(.title3)
        .padding([.top, .bottom], 8)
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            RateView(rate: .default)
            RateView(rate: .default)
        }
    }
}
