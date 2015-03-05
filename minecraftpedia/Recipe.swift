//
//  Recipe.swift
//  minecraftpedia
//
//  Created by Anne Plunket on 05/03/2015.
//  Copyright (c) 2015 moa. All rights reserved.
//

import Foundation

struct Recipe {
    let ingredients: [String?]
    let count: Int
    
    init(json: JSON) {
        println("json: \(json)")
        self.ingredients = map(json["recipe"].arrayValue) { $0.string }
        self.count = json["output"].intValue
    }
}
