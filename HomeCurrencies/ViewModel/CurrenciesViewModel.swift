//
//  CurrenciesViewModel.swift
//  HomeCurrencies
//
//  Created by Darek Barańczuk on 22/09/2023.
//

import Foundation

class CurrenciesViewModel: ObservableObject {
    
    @Published private(set) var currencies: CurrenciesTable?
    
    init() {
        Task.init {
            await fetchData()
        }
    }
    
    func fetchData() async {
        do {
            guard let url = URL(string: "https://api.nbp.pl/api/exchangerates/tables/A/?format=json")
            else { fatalError("Invalid url!") }
            
            let urlRequeset = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequeset)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 
            else { fatalError("HTTP \((response as? HTTPURLResponse)?.statusCode ?? 0)") }
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([CurrenciesTable].self, from: data)
            
            DispatchQueue.main.async {
                self.currencies = decodedData[0]
            }
            
        } catch {
            print("Error: \(error)")
        }
    }
}
