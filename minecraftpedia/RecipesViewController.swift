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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item.recipes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier( "Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = "item"
        return cell
    }
}
