//
//  ArticleItem.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 08.08.24.
//

import SwiftUI

struct ArticleItem: View {
    
    var article: Article

        var body: some View {
            HStack {
                Image(article.image ?? "PS 5")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                VStack {
                    Text(article.name)
                        .font(.headline)
                    Text("\(article.price, specifier: "%.2f") €")
                        .font(.subheadline)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 4)
        }
}

#Preview {
    ArticleItem(article: Article(Category(name: "Elektronik", logo: "Logo Elektronik", articleList: []), "PlayStation 5", false, "palaberSülzQuatsch", nil, 399.99))
}
