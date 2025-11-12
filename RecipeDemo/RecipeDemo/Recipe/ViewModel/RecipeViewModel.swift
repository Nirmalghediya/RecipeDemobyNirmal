//
//  RecipeViewModel.swift
//  RecipeDemo
//
//  Created by Nirmal Ghediya on 11/11/25.
//

import Foundation
import Combine

@MainActor
final class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = RecipeService()
    
    func loadRecipes() async {
        isLoading = true
        errorMessage = nil
        do {
            recipes = try await service.fetchRecipes()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}

