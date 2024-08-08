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
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
                TextField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
                TextField("Kontostand", text: $balanceString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
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
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(10)
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
