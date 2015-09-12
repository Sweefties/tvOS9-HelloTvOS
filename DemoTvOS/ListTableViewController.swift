//
//  ListTableViewController.swift
//  DemoTvOS
//
//  Created by Wlad Dicario on 12/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    // MARK: - Properties
    let cellID = "defaultCell"
    let list:[String] = ["iOS 9",
        "WatchOS 2",
        "tvOS",
        "iPhone 6S",
        "iPad Pro",
        "Pencil",
        "Smart Keyboard",
        "Xcode 7",
        "Swift 2",
        "..and more"
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // navigation title
        self.title = "What's new?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//MARK: - ListTableViewDataSource -> ListTableViewController Extension
typealias ListTableViewDataSource = ListTableViewController
extension ListTableViewDataSource {

    /// Number of Sections
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /// Number of Rows
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count ?? 0
    }
    
    /// Reuse Cell for Row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = "\(list[indexPath.row])"
        cell.detailTextLabel?.text = "\(indexPath.row)"
        return cell
    }
}
