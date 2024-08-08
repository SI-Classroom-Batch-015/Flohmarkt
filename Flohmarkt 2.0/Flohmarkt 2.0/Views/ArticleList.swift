//
//  ArticleList.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 08.08.24.
//

import SwiftUI

struct ArticleList: View {
    @EnvironmentObject var aViewModel: ArticleViewModel
    @EnvironmentObject var uViewModel: UserViewModel
    var category : Category
    
    var body: some View {
        VStack {
            Image(category.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text(category.name)
                .font(.title)
                .padding()
            
            List {
                ForEach(category.articleList) { article in
                    ArticleItem(article: article)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ArticleList(category: Category(name: "Elektronik", logo: "Logo Elektronik", articleList: []))
        .environmentObject(UserViewModel())
        .environmentObject(ArticleViewModel())
}
