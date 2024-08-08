//
//  AddArticleCard.swift
//  Flohmarkt 2.0
//
//  Created by Marcel Schwabe on 07.08.24.
//

import SwiftUI

struct AddArticleCard: View {
    @EnvironmentObject var aViewModel: ArticleViewModel
    @EnvironmentObject var uViewModel: UserViewModel
    @State private var name: String = ""
    @State private var isNew: Bool = false
    @State private var description: String = ""
    @State private var price: Double = 0.0
    @State private var selectedImageName: String = ""
    @State private var articleImages: [String] = []
    @State private var priceString: String = ""
    @State private var showAlert: Bool = false
    @State private var isSuccess: Bool = false
    @State private var isNavigating: Bool = false
    var category: Category
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(category.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                    .clipShape(Circle())
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(100)
                
                Text(category.name)
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
                
                Section("Artikel Daten") {
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                    Toggle(isOn: $isNew) {
                        Text(isNew ? "Neu" : "Gebraucht")
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
                    TextField("Beschreibung", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                    TextField("Preis", text: $priceString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                        .onChange(of: priceString) {_ , newValue in
                            if let newBalance = Double(newValue) {
                                price = newBalance
                            } else {
                                price = 0.0
                            }
                        }
                    Picker("Bild laden", selection: $selectedImageName) {
                        ForEach(articleImages, id: \.self) { artImage in
                            
                            Image(artImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Spacer(minLength: 50)
                        }
                    }
                    .pickerStyle(.wheel)
                    .onAppear {
                        articleImages = aViewModel.loadArticleImages(for: category)
                    }
                    Button("Artikel erstellen und verkaufen"){
                        let newArticle = Article(
                            category,
                            name,
                            isNew,
                            description,
                            selectedImageName,
                            price
                        )
                        uViewModel.currentUser?.articles2Sell.append(newArticle)
                        aViewModel.addArticle(to: category, article: newArticle)
                        
                        showAlert = true
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                }
            }
            
            .alert("Artikel gespeichert", isPresented: $showAlert) {
                Button("OK") {
                    isNavigating = true
                }
            } message: {
                Text("Artikel in beiden Listen gespeichert")
            }
            .background(
                NavigationLink("", destination: MainMenue()
                    .environmentObject(uViewModel)
                    .environmentObject(aViewModel), isActive: $isNavigating)
                .hidden()
            )
        }
    }
}

#Preview {
    AddArticleCard(category: Category(name: "Elektronik", logo: "Logo Elektronik", articleList: []))
        .environmentObject(ArticleViewModel())
        .environmentObject(UserViewModel())
}
