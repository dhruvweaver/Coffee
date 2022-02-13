//
//  CoffeeData.swift
//  Coffee
//
//  Created by Dhruv Weaver on 2/12/22.
//

import Foundation

class CoffeeData {
    var coffeeTypes: [Coffee] = []
    private var json: [JSONData]? = nil
    
    struct JSONData: Decodable, Identifiable {
        let title: String
        let description: String
        let ingredients: [String]
        let id: Int
    }
    
    func getData() async {
        let url = URL(string: "https://api.sampleapis.com/coffee/hot")!
        let urlSession = URLSession.shared
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            self.json = try JSONDecoder().decode([JSONData].self, from: data)
        } catch {
            debugPrint("Error loading \(url): \(String(describing: error))")
        }
    }
    
    func parseToObject() {
        if let processed = json {
            for i in processed {
                coffeeTypes.append(Coffee(title: i.title, description: i.description, ingredients: i.ingredients))
            }
        }
    }
}
