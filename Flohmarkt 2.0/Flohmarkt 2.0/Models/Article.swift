//
//  Article.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import Foundation

struct Article: Identifiable, Hashable {
    
    let id = UUID()
    let category: enumCategory
    let name: String
    var isNew: Bool
    let description: String
    let image: String?
    let price: Double
    
    init(_ category: enumCategory,_ name: String,_ isNew: Bool = false,_ description: String,_ image: String? = nil,_ price: Double) {
        self.category = category
        self.name = name
        self.isNew = isNew
        self.description = description
        self.image = image
        self.price = price
    }
}

struct MockArticle {
    static let eArticle = Article(.elektronik, "PlayStation 5", false, "palaberSülzQuatsch", nil, 399.99)
    static let hArticle = Article(.haushalt, "WischEimer", true, "LaberRhabarber", nil, 17.90)
    static let sArticle = Article(.spielzeug, "Wasserpistole", true, "...", nil, 9.44)
}
