//
//  SignUpView.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State var userName: String = ""
    @State var password: String = ""
    @State var balance: Double = 0.0
    @State private var balanceString: String = ""
    @State private var isCreated: Bool = false
    
    var body: some View {
        NavigationStack {
            Section("Nutzerdaten") {
                TextField("User Name", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Kontostand", text: $balanceString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: balanceString) {_ , newValue in
                        if let newBalance = Double(newValue) {
                            balance = newBalance
                        } else {
                            balance = 0.0
                        }
                    }
            }
            
            Button("account erstellen") {
                if viewModel.signUp(userName: userName, password: password, balance: balance) {
                    isCreated = true
                }
            }
            .padding()
            NavigationLink(destination: MainMenue().environmentObject(viewModel), isActive: $isCreated) {
                EmptyView()
            }
            
        }
    }
}

#Preview {
    SignUpView().environmentObject(UserViewModel())
}
