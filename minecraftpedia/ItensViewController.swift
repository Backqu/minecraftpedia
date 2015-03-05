//
//  ItensViewController.swift
//  minecraftpedia
//
//  Created by Lucas Juillard on 02/03/2015.
//  Copyright (c) 2015 moa. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var items: [String: JSON]!
    var recipes: JSON!
    var recipeNames: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
//part for items
    
		let itemspath = NSBundle.mainBundle().pathForResource("items", ofType: "json")
		let itemsdata = NSData(contentsOfFile: itemspath!)
        let itemsArray = JSON(data: itemsdata!)["minecraft"].dictionaryValue.values.array
        self.items = [:]
        
        for item in itemsArray {
            self.items[item["name"].stringValue] = item
        }
        
        let recipespath = NSBundle.mainBundle().pathForResource("recipes", ofType: "json")
        let recipesdata = NSData(contentsOfFile: recipespath!)
        self.recipes = JSON(data: recipesdata!)
        self.recipeNames = self.recipes.dictionaryValue.keys.array.sorted { (a, b) in
            return a < b
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch (section) {
//        case 0:
//            return "Tools"
//        case 1:
//            return "Blocks"
//        case 2:
//            return "Weapons"
//        default:
//            assertionFailure("error")
//        }
//    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipeNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let name = self.recipeNames[indexPath.row]
        cell.textLabel!.text = name
        
        cell.imageView!.image = nil;
        if let item = self.items[name] {
            let image = item["image"].stringValue
            cell.imageView!.setImageWithURL(NSURL(string: "http://assets.wurstmineberg.de/img/grid/\(image)"))
        }

        return cell
    }
}							