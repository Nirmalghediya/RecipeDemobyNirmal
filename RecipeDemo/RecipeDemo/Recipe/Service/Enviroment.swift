//
//  Enviroment.swift
//  RecipeDemo
//
//  Created by Nirmal Ghediya on 11/11/25.
//

import Foundation
enum APIEnvironment {
    case staging, production
}

struct ServerConfig {
    
    public static var releaseMode: APIEnvironment  = .staging
    
    struct URLs {
        
        //MARK: Set base URL
        
        fileprivate static var baseURL: String {
            get {
                switch releaseMode {
                    case .staging: return "https://d3jbb8n5wk0qxi.cloudfront.net/"
                    case .production: return ""
                }
            }
        }
        
        fileprivate struct Version {
            
            //MARK: Set Basepath but i set here endpoint
            
            static var basePath = "recipes.json"
            
            
            static var base: String {
                get {
                    switch releaseMode {
                    case .staging: return basePath
                    case .production: return basePath
                    }
                }
            }
        }
        
        static var base: String {
            get {
                return URLs.baseURL + Version.base
            }
        }
    }
}

