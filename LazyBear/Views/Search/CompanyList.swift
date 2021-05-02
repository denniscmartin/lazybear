//
//  CompanyList.swift
//  LazyBear
//
//  Created by Dennis Concepción Martín on 3/4/21.
//

import SwiftUI

struct CompanyList: View {
    var searchResult: [SearchResponse]
    
    var body: some View {
        List(searchResult, id: \.self) { company in
            SearchedCompanyItem(company: company)
        }
    }
}

struct CompanyList_Previews: PreviewProvider {
    @Environment(\.presentationMode) static var presentationMode
    
    static var previews: some View {
        CompanyList(searchResult: [SearchResponse(currency: "USD", region: "US", securityName: "aaple inc", symbol: "aapl"), SearchResponse(currency: "USD", region: "US", securityName: "aaple inc", symbol: "aapl"), SearchResponse(currency: "USD", region: "US", securityName: "aaple inc", symbol: "aapl"), SearchResponse(currency: "USD", region: "US", securityName: "aaple inc", symbol: "aapl"), SearchResponse(currency: "USD", region: "US", securityName: "aaple inc", symbol: "aapl")])
    }
}
