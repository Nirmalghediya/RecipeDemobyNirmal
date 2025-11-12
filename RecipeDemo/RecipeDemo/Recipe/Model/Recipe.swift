//
//  Recipe.swift
//  RecipeDemo
//
//  Created by Nirmal Ghediya on 11/11/25.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct Recipe: Identifiable, Codable, Hashable {
    let id = UUID() // Local ID for SwiftUI
    let uuid: String?
    let name: String?
    let cuisine: String?
    let photo_url_large: String?
    let photo_url_small: String?
    let source_url: String?
    let youtube_url: String?
}
