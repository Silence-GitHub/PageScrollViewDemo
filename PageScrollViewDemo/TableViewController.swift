//
//  TableViewController.swift
//  PageScrollViewDemo
//
//  Created by Kaibo Lu on 2017/3/8.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // MARK: - Table view data source

    private let titles: [String] = ["Page scroll view",
                                    "Page collection view long",
                                    "Page collection view short",
                                    "Page collection + scroll view"]
    
    private var vcs: [UIViewController] {
        get {
            return [PageScrollVC(),
                    PageCollectionVC(),
                    PageCollectionVC2(),
                    PageCollectionVC3()]
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(vcs[indexPath.row], animated: true)
        
    }

}
