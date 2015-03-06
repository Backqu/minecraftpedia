//
//  ItensViewController.swift
//  minecraftpedia
//
//  Created by Lucas Juillard on 02/03/2015.
//  Copyright (c) 2015 moa. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var sortedItems: [Item]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sortedItems = sorted(Item.allItems.values) { (a, b) in
            a.name < b.name
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
        return self.sortedItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let item = self.sortedItems[indexPath.row]
        cell.textLabel!.text = item.name
        
        let placeholder = UIImage(named: "placeholder")
        cell.imageView!.image = placeholder
        cell.imageView!.contentMode = .ScaleAspectFill
        
        if let imageURL = item.imageURL {
            cell.imageView!.setImageWithURL(imageURL)
        }

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if let recipesViewController = segue.destinationViewController as? RecipesViewController,
            let cell = sender as? UITableViewCell {
            let indexPath = self.tableView.indexPathForCell(cell)!
            recipesViewController.item = self.sortedItems[indexPath.row]
        }
    }
}