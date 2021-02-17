//
//  Watchlist.swift
//  LazyBear
//
//  Created by Dennis Concepción Martín on 17/2/21.
//

import SwiftUI

struct Watchlist: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \WatchlistCompanies.name, ascending: true)])
    var companies: FetchedResults<WatchlistCompanies>
    
    var body: some View {
        //let watchlistManager = WatchlistManager()
        
        
        List(companies) { company in
            let name = company.name ?? "Preview name"
            let symbol = company.symbol ?? "Preview symbol"
            Row(baseText: name, underText: symbol)
        }
        .onAppear {
            //watchlistManager.addWatchlist(name: "Test", symbol: "Test")
        }
    }
    
    // Add to watchlist
    private func addWatchlist(name: String, symbol: String) {
        let watchlistCompanies = WatchlistCompanies(context: viewContext)
        watchlistCompanies.name = name
        watchlistCompanies.symbol = symbol
        do {
            try viewContext.save()
            print("Company saved.")
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct Watchlist_Previews: PreviewProvider {
    static var previews: some View {
        Watchlist()
    }
}
