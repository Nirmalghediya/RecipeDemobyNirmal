//
//  RecipeService.swift
//  RecipeDemo
//
//  Created by Nirmal Ghediya on 11/11/25.
//

import Foundation

final class RecipeService {
    private var baseURL: String {
        ServerConfig.URLs.base
    }
    
    private var endpoint: URL {
        URL(string: baseURL)!
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        let (data, _) = try await URLSession.shared.data(from: endpoint)
        let decoded = try JSONDecoder().decode(RecipeResponse.self, from: data)
        return decoded.recipes
    }
}

