//
//  CompanyData.swift
//  LazyBear
//
//  Created by Dennis Concepción Martín on 31/12/20.
//

import SwiftUI

struct CompanyDataModel: Hashable, Codable {
    var cik: Int
    var symbol: String
    var name: String
}