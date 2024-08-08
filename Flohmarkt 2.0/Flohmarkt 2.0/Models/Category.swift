//
//  Category.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import Foundation

struct Category: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let logo: String
    var articleList: [Article]
}
