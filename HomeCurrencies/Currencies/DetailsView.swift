//
//  DetailsView.swift
//  HomeCurrencies
//
//  Created by Darek Barańczuk on 23/09/2023.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.managedObjectContext) var moc
    
    var rate: Rate
    
    var body: some View {
        VStack {
            Text(rate.currency)
                .font(.largeTitle)
            HStack {
                Text(rate.formattedValue)
                Text(rate.code)
            }
            
            Button {
                let persistedRate = PersistedRate(context: moc)
                persistedRate.code = rate.code
                persistedRate.rate = rate.mid
                persistedRate.timestamp = Date().currentTimeMillis()
                
                do {
                    try self.moc.save()
                } catch {
                    print("Unable to save data! \(error)")
                }
                
            } label: {
                Text("Test")
            }
        }
    }
}

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(rate: .default)
    }
}
