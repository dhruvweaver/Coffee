//
//  Coffee.swift
//  Coffee
//
//  Created by Dhruv Weaver on 2/12/22.
//

import Foundation

class Coffee {
    private let title: String!
    private let description: String!
    private let ingredients: [String]!
    
    init(title: String, description: String, ingredients: [String]) {
        self.title = title
        self.description = description
        self.ingredients = ingredients
    }
    
    func getTitle() -> String {
        return title
    }

    func getDescription() -> String {
        return description
    }

    func getIngredients() -> [String] {
        return ingredients
    }
}
