//
//  MainMenue.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import SwiftUI

struct MainMenue: View {
    @EnvironmentObject var uViewModel: UserViewModel
    @EnvironmentObject var aViewmodel: ArticleViewModel
    
    var body: some View {
        NavigationStack {
            if let user = uViewModel.currentUser {
                Text("Willkommen \(user.userName)")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            }
            else {
                Text("Willkommen, Gast")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            }
            NavigationLink("Verkaufen",destination: CategoriesSell()
                .environmentObject(aViewmodel)
                .environmentObject(uViewModel))
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(10)
            NavigationLink("Kaufen",destination: CategoriesBuy())
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
            NavigationLink("LogOut",destination: LogInView())
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainMenue()
        .environmentObject(ArticleViewModel())
        .environmentObject(UserViewModel())
}
