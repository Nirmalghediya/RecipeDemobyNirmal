//
//  RecipeDetailView.swift
//  RecipeDemo
//
//  Created by Nirmal Ghediya on 11/11/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // MARK: - Recipe Image
                AsyncImage(url: URL(string: recipe.photo_url_large ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            
                    case .failure(_):
                        Color.gray.overlay(
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        )
                    default:
                        ProgressView()
                    }
                }
                .frame(height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(radius: 4)
                .padding(.horizontal,18)
                
                // MARK: - Recipe Info
                VStack(alignment: .leading, spacing: 8) {
                    Text(recipe.name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Cuisine: \(recipe.cuisine ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                // MARK: - YouTube Button
                if let youtube = recipe.youtube_url,
                   let url = URL(string: youtube) {
                    Button {
                        UIApplication.shared.open(url)
                    } label: {
                        Label("Watch on YouTube", systemImage: "play.circle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.9))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(radius: 3)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                
                Spacer()
            }
            .padding(.bottom, 30)
        }
        .navigationTitle(recipe.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipeDetailView(
        recipe: Recipe(
            uuid: "123",
            name: "Chocolate Cake",
            cuisine: "French",
            photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/bfc6bc1d-3e24-4f9e-a496-bd4f3f002539/large.jpg",
            photo_url_small: "",
            source_url: nil,
            youtube_url: "https://www.youtube.com/watch?v=dsJtgmAhFF4"
        )
    )
}
