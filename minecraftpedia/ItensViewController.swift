//
//  ItensViewController.swift
//  minecraftpedia
//
//  Created by Lucas Juillard on 02/03/2015.
//  Copyright (c) 2015 moa. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var items: [JSON]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

		let path = NSBundle.mainBundle().pathForResource("minecraft", ofType: "json")
		let data = NSData(contentsOfFile: path!)
        self.items = JSON(data: data!)["minecraft"].dictionaryValue.values.array.sorted { (a, b) in
            return a["name"] < b["name"]
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
    
    override func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let item = self.items[indexPath.row]
        cell.textLabel!.text = item["name"].stringValue
        let image = item["image"].stringValue
        cell.imageView!.setImageWithURL(NSURL(string: "http://assets.wurstmineberg.de/img/grid/\(image)"))
        return cell
    }
}							