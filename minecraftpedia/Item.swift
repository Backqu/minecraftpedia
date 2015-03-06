//
//  Items.swift
//  minecraftpedia
//
//  Created by Anne Plunket on 05/03/2015.
//  Copyright (c) 2015 moa. All rights reserved.
//

import Foundation

extension Dictionary {
	func map<OutKey: Hashable, OutValue>(transform: Element -> (OutKey, OutValue)) -> [OutKey: OutValue] {
		var outDictionary: [OutKey: OutValue] = [:]
		for tuple in self {
			let (newKey, newValue) = transform(tuple)
			outDictionary[newKey] = newValue
		}
		return outDictionary
	}
}

struct Item {
    let name: String
    let imageURL: NSURL?
    let recipes: [Recipe]
    
    init(name: String, json: JSON) {
        self.name = name
        
        if let itemJSON = Item.itemsJSON[name]?.dictionary {
            let image = itemJSON["image"]!.stringValue
            self.imageURL = NSURL(string: "http://assets.wurstmineberg.de/img/grid/\(image)")
        } else {
            self.imageURL = nil
        }
        
        self.recipes = map(json.arrayValue) { recipeJSON in
            return Recipe(json: recipeJSON)
        }
    }

    private static var _allItemsOnceToken: dispatch_once_t = 0
    private static var _allItems: [String: Item]!
    static var allItems: [String: Item] {
        dispatch_once(&_allItemsOnceToken) {
			self._allItems = self.recipesJSON.dictionaryValue.map({ (name, json) in
				(name, Item(name: name, json: json))
			})
			return
        }
        
        return _allItems
    }
    
    private static var _itemsOnceToken: dispatch_once_t = 0
    private static var _itemsJSON:  [String: JSON]!
    static var itemsJSON: [String: JSON] {
        dispatch_once(&_itemsOnceToken) {
            let path = NSBundle.mainBundle().pathForResource("items", ofType: "json")
            let data = NSData(contentsOfFile: path!)
            let array = JSON(data: data!)["minecraft"].dictionaryValue.values.array
            self._itemsJSON = [:]
            
            for item in array {
                let name = item["name"].stringValue
                self._itemsJSON[name] = item
            }
        }
        
        return _itemsJSON
    }
    
    private static var _recipesOnceToken: dispatch_once_t = 0
    private static var _recipesJSON: JSON!
    static var recipesJSON: JSON {
        dispatch_once(&_recipesOnceToken) {
            let path = NSBundle.mainBundle().pathForResource("recipes", ofType: "json")
            let data = NSData(contentsOfFile: path!)
            self._recipesJSON = JSON(data: data!)
        }
        
        return _recipesJSON
    }
}