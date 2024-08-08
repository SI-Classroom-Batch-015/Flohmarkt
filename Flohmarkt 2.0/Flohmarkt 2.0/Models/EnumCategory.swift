//
//  Category.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import Foundation

enum EnumCategory: String, CaseIterable {
    case elektronik = "Elektronik"
    case haushalt = "Haushalt"
    case spielzeug = "Spielzeug"
    
    func loadImages(for category: Category) -> [String] {
        switch self {
        case .elektronik:
            return ["PS 5"]
        case .haushalt:
            return []
        case .spielzeug:
            return []
        }
    }
}
