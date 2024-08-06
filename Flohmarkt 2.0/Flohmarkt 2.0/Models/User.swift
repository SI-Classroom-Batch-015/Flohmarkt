//
//  User.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id = UUID()
    let userName: String
    let password: String
    let balance: Double
    let articles2Sell: [Article]
    
    init(userName: String, password: String, balance: Double, articles2Sell: [Article] = []) {
        self.userName = userName
        self.password = password
        self.balance = balance
        self.articles2Sell = articles2Sell
    }
    
    func verifyPassword(_ password: String) -> Bool {
        return password == self.password
    }
}

struct MockUser {
    static let xUser = User(userName: "Balti", password: "iha1410g", balance: 200.00)
}
