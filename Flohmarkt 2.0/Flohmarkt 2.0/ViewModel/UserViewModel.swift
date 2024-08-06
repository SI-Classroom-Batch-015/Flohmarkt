//
//  UserViewModel.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var userList: [User] = []
    @Published var currentuser: User? = nil
    
    init() {
        userList.append(MockUser.xUser)
    }
    
    func LogIn(userName: String, password: String) -> Bool {
        if let user = userList.first(where: { $0.userName == userName}) {
            if user.verifyPassword(password) {
                currentuser = user
                return true
            }
        }
        return false
    }
    
    func logOut() {
        currentuser = nil
    }
    
    func signUp(userName: String, password: String, balance: Double) -> Bool {
        if userList.contains(where: {$0.userName == userName}) {
            return false
        }
        let newUser = User(userName: userName, password: password, balance: balance)
        
        userList.append(newUser)
        return true
    }
}
