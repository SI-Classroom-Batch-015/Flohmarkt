//
//  CategoriesBuy.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 07.08.24.
//

import SwiftUI

struct CategoriesBuy: View {
    @EnvironmentObject var aViewModel: ArticleViewModel
    @EnvironmentObject var uViewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Willkommen!")
                    .font(.largeTitle)
                    .padding()
                Text("In welcher Kategorie möchtest Du kaufen?")
                    .padding()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(aViewModel.categories) { cat in
                            NavigationLink(destination: ArticleList(category: cat)) {
                                VStack {
                                    Image(cat.logo)
                                        .resizable()
                                        .frame(width: 200, height: 100)
                                    Text(cat.name)
                                }
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
    CategoriesBuy().environmentObject(ArticleViewModel())
}
