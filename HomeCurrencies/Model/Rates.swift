//
//  Rates.swift
//  HomeCurrencies
//
//  Created by Darek Barańczuk on 22/09/2023.
//

import Foundation

struct CurrenciesTable: Codable, Hashable {
    var table: String
    var effectiveDate: String
    var rates: [Rate]
}

struct Rate: Codable, Hashable {
    static let `default` = Rate(currency: "Polski zloty", code: "PLN", mid: 1.00)
    
    var currency: String
    var code: String
    var mid: Double
    
    var formattedValue: String {
        return String(format: "%.2f", mid)
    }
}
