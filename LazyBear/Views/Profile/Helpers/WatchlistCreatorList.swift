//
//  WatchlistCreatorList.swift
//  LazyBear
//
//  Created by Dennis Concepción Martín on 2/5/21.
//

import SwiftUI
import Bazooka

struct WatchlistCreatorList: View {
    @ObservedObject var watchlistCreatorClass: WatchlistCreatorClass
    @State private var searchedCompany = String()
    @State private var companies = [SearchResponse]()
    
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) private var moc
    
    var body: some View {
        NavigationView {
            VStack {
                WatchlistCreatorSearchBar(searchedCompany: $searchedCompany)
                
                List(companies, id: \.self) { company in
                    WatchlistCreatorRow(company: company, presentationMode: presentationMode, watchlistCreatorClass: watchlistCreatorClass)
                        .environment(\.managedObjectContext, self.moc)
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: searchedCompany, perform: { searchedCompany in
                if !searchedCompany.isEmpty {
                    // Encode string with spaces
                    let encodedSearchedCompany = searchedCompany.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                    request("https://api.lazybear.app/search/text=\(encodedSearchedCompany ?? "")")
                }
            })
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", action: { presentationMode.wrappedValue.dismiss() })
                }
            }
        }
    }
    
    private func request(_ url: String) {
        let bazooka = Bazooka()
        bazooka.request(url: url, model: [SearchResponse].self) { response in
            self.companies = response
        }
    }
}

struct SearchCompanies_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistCreatorList(watchlistCreatorClass: WatchlistCreatorClass())
    }
}
