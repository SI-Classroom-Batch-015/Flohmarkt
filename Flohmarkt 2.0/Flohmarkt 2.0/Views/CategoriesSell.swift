//
//  SellCategories.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 07.08.24.
//

import SwiftUI

struct CategoriesSell: View {
    @EnvironmentObject var aViewModel: ArticleViewModel
    @EnvironmentObject var uViewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Willkommen!")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
                Text("In welcher Kategorie möchtest Du verkaufen?")
                    .padding()
                    .foregroundColor(.green)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(aViewModel.categories) { cat in
                            NavigationLink(destination: AddArticleCard(category: cat)) {
                                VStack {
                                    Image(cat.logo)
                                        .resizable()
                                        .frame(width: 200, height: 100)
                                        .background(Color.green.opacity(0.1))
                                        .cornerRadius(10)
                                    Text(cat.name)
                                        .foregroundColor(.green)
                                }
                                .padding()
                                .background(Color.green.opacity(0.1))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    CategoriesSell().environmentObject(ArticleViewModel())
        .environmentObject(UserViewModel())
}
