//
//  WatchlistRow.swift
//  LazyBear
//
//  Created by Dennis Concepción Martín on 25/1/21.
//

import SwiftUI
import CoreData

struct WatchlistRow: View {
    @ObservedObject var companyView = CompanyView()
    var company: WatchlistCompany
    
    var body: some View {
        Button(action: { companyView.isShowing.toggle() }) {
            VStack(alignment: .leading) {
                Text(company.symbol!.uppercased())
                    .fontWeight(.semibold)
                
                Text(company.name!.capitalized)
                    .font(.caption)
                
            }
        }
    }
}

struct WatchlistRow_Previews: PreviewProvider {
    // Avoid preview crashing
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let watchlistCompany = WatchlistCompany(context: moc)
        watchlistCompany.name = "apple inc"
        watchlistCompany.symbol = "aapl"
        return WatchlistRow(company: watchlistCompany)
    }
}
