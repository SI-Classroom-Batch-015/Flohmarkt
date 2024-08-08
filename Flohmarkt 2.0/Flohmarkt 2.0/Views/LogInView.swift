//
//  LogInView.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Willkommen")
                    .font(.largeTitle)
                    .padding()
                
                Section {
                    TextField("User Name", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    SecureField("Passwort", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                Button("LogIn") {
                    if viewModel.logIn(userName: userName, password: password) {
                        isLoggedIn = true
                    }
                }
                .padding()
                NavigationLink(destination: MainMenue().environmentObject(viewModel), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                
                NavigationLink(destination: SignUpView().environmentObject(viewModel)) {
                    Text("SignUp")
                }
            }
        }
    }
}

#Preview {
    LogInView().environmentObject(UserViewModel())
}
