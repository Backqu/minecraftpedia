//
//  RecipesViewController.swift
//  minecraftpedia
//
//  Created by Anne Plunket on 02/03/2015.
//  Copyright (c) 2015 moa. All rights reserved.
//

import UIKit

class RecipesViewController: UITableViewController  {
    var item: Item!
    @IBOutlet var ingredientButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recipe = item.recipes.first!
        let placeholder = UIImage(named: "placeholder")
        for (index, ingredientName) in enumerate(recipe.ingredients) {
			if let ingredientName = ingredientName {
                if let ingredient = Item.allItems[ingredientName] {
					self.ingredientButtons[index].setImageForState(.Normal, withURL: ingredient.imageURL, placeholderImage: placeholder)
				}
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var headerFrame = self.tableView.tableHeaderView!.frame
        headerFrame.size.height = headerFrame.size.width
        self.tableView.tableHeaderView!.frame = headerFrame
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item.recipes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier( "Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = "item"
        return cell
    }
}
