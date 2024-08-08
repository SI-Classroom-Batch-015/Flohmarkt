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
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
                
                Section {
                    TextField("User Name", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                    SecureField("Passwort", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                }
                
                Button("LogIn")
                {
                    if uViewModel.logIn(userName: userName, password: password) {
                        isLoggedIn = true
                    }
                    
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
                NavigationLink(destination: MainMenue().environmentObject(uViewModel), isActive: $isLoggedIn) {
                    EmptyView()
                }
                .padding()
                
                
                NavigationLink(destination: SignUpView().environmentObject(uViewModel)) {
                    Text("SignUp")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LogInView()
        .environmentObject(UserViewModel())
        .environmentObject(ArticleViewModel())
}
