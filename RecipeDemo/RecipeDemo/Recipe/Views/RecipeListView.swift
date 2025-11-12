//
//  RecipeListView.swift
//  RecipeDemo
//
//  Created by Nirmal Ghediya on 11/11/25.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeViewModel()

    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink(value: recipe) {
                            VStack(alignment: .leading, spacing: 8) {
                                AsyncImage(url: URL(string: recipe.photo_url_small ?? "")) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(height: 140)
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(recipe.name ?? "")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                        .lineLimit(1)
                                    
                                    Text(recipe.cuisine ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.horizontal, 8)
                                .padding(.bottom, 8)
                            }
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 3)
                        }
                    }
                }
                .padding()
            }
            .task { await viewModel.loadRecipes() }
            .navigationTitle("Recipes")
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
            }
        }
    }
}

#Preview {
    RecipeListView()
}


