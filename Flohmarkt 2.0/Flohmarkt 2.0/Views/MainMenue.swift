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
            }
            else {
                Text("Willkommen, Gast")
                    .font(.largeTitle)
            }
            NavigationLink("Verkaufen",destination: CategoriesSell()
                .environmentObject(aViewmodel)
                .environmentObject(uViewModel))
                .padding()
                .buttonStyle(.bordered)
            NavigationLink("Kaufen",destination: CategoriesBuy())
                .padding()
                .buttonStyle(.bordered)
            NavigationLink("LogOut",destination: LogInView())
                .padding()
                .buttonStyle(.bordered)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainMenue()
        .environmentObject(ArticleViewModel())
        .environmentObject(UserViewModel())
}
