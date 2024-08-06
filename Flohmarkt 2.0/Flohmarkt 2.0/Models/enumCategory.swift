//
//  Category.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import Foundation

enum enumCategory: String, CaseIterable {
    case elektronik = "Elektronik"
    case haushalt = "Haushalt"
    case spielzeug = "Spielzeug"
    
    func loadImages() -> [String] {
        switch self {
        case .elektronik:
            return []
        case .haushalt:
            return []
        case .spielzeug:
            return []
        }
    }
}
