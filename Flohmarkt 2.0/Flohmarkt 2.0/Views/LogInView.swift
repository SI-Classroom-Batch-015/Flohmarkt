//
//  LogInView.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var uViewModel: UserViewModel
    @EnvironmentObject var aViewModel: ArticleViewModel
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Willkommen")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color.purple.opacity(0.78))
                    .padding(.top, 56)
                    .padding(.horizontal, 16)
                
                Section {
                    TextField("User Name", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    SecureField("Passwort", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                Button("LogIn") {
                    if uViewModel.logIn(userName: userName, password: password) {
                        isLoggedIn = true
                    }
                }
                .padding()
                NavigationLink(destination: MainMenue().environmentObject(uViewModel), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                
                NavigationLink(destination: SignUpView().environmentObject(uViewModel)) {
                    Text("SignUp")
                }
            }
        }
    }
}

#Preview {
    LogInView()
        .environmentObject(UserViewModel())
        .environmentObject(ArticleViewModel())
}
