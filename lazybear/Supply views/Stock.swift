//
//  Stock.swift
//  LazyBear
//
//  Created by Dennis Concepción Martín on 25/1/21.
//

import SwiftUI

struct Stock: View {
    @Environment(\.managedObjectContext) private var viewContext
    var name: String
    var symbol: String
    
    var body: some View {
        Button(action: { addWatchlist(name: name, symbol: symbol) }) {
            Text("Add to watchlist")
        }

    }
    
    func addWatchlist(name: String, symbol: String) {
        let watchlistCompany = WatchlistCompany(context: viewContext)
        watchlistCompany.name = name
        watchlistCompany.symbol = symbol
        do {
            try viewContext.save()
            print("Company saved.")
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct Stock_Previews: PreviewProvider {
    static var previews: some View {
        Stock(name: "apple inc", symbol: "aapl")
    }
}
