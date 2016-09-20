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
    let list:[String] = ["iOS 10",
        "WatchOS 3",
        "tvOS 10",
        "iPhone 7",
        "iPad Pro",
        "Pencil",
        "Smart Keyboard",
        "Xcode 8",
        "Swift 3",
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Number of Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    /// Reuse Cell for Row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = "\(list[(indexPath as NSIndexPath).row])"
        cell.detailTextLabel?.text = "\((indexPath as NSIndexPath).row)"
        return cell
    }
}
