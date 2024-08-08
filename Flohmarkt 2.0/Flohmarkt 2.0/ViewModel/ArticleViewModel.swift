//
//  ArticleViewModel.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 06.08.24.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var categories: [Category] = []
    
    init() {
        self.categories = [
            Category(name: "Haushalt", logo: "Logo Haushalt", articleList: []),
            Category(name: "Elektronik", logo: "Logo Elektronik", articleList: []),
            Category(name: "Spielzeug", logo: "Logo Spielzeug", articleList: [])
        ]
    }
    
    func addArticle(to category: Category, article: Article) {
        if let index = categories.firstIndex(where: {$0.id == category.id }) {
            categories[index].articleList.append(article)
        }
    }
    
    func loadArticleImages(for category: Category) -> [String] {
        let articleNames: [String]
        switch category.name {
        case "Haushalt":
            articleNames = ["Akku Staubsauger","Fensterputzer","Organizer"]
        case "Elektronik":
            articleNames = ["PS 5","Fernseher","Soundbar"]
        case "Spielzeug":
            articleNames = ["Magnetbausteine","RC Auto","Raketenrampe"]
        default:
            articleNames = []
        }
        return articleNames
    }
}
