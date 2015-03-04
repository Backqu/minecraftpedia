//
//  ItensViewController.swift
//  minecraftpedia
//
//  Created by Lucas Juillard on 02/03/2015.
//  Copyright (c) 2015 moa. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Hello")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "Tools"
        case 1:
            return "Blocks"
        case 2:
            return "Weapons"
        default:
            assertionFailure("error")
        }
    }
    
    override func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = "Item"
        return cell
    }
}							