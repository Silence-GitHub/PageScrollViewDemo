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
    
    private var vcs: [[String : String]] {
        get {
            return [["title" : "Page scroll view", "vc" : "PageScrollVC"],
                    ["title" : "Page collection view long", "vc" : "PageCollectionVC"],
                    ["title" : "Page collection view short", "vc" : "PageCollectionVC2"],
                    ["title" : "Page collection + scroll view", "vc" : "PageCollectionVC3"]]
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vcs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = vcs[indexPath.row]["title"]
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let clazz = classFrom(vcs[indexPath.row]["vc"]!) as! UIViewController.Type
        navigationController?.pushViewController(clazz.init(), animated: true)
    }
    
    func classFrom(_ string: String) -> AnyClass? {
        if let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return NSClassFromString("\(name).\(string)")
        }
        return NSClassFromString(string)
    }
}
