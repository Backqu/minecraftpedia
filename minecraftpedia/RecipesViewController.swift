//
//  RecipesViewController.swift
//  minecraftpedia
//
//  Created by Anne Plunket on 02/03/2015.
//  Copyright (c) 2015 moa. All rights reserved.
//

import UIKit

class RecipesViewController: UITableViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
        println("world")
 
}
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0 :
            return "recipes making"
        case 1 :
            return "recipes using"
        default :
            assertionFailure("error")
            
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier( "Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = "item"
        return cell
    }
}
