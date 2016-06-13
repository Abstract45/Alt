//
//  ViewController.swift
//  my-hood-abstract
//
//  Created by Miwand Najafe on 2016-03-13.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    let dataService = DataService.sharedInstance
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        dataService.loadPosts()
        tableview.delegate = self
        tableview.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)
        
    }
    
    func onPostsLoaded(notif:NSNotification) {
        tableview.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataService.loadedPosts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableview.dequeueReusableCellWithIdentifier("postCell") as? PostCell {
            
            cell.configCell(dataService.loadedPosts[indexPath.row])
            return cell
            
        } else {
            let cell = PostCell()
            cell.configCell(dataService.loadedPosts[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95.0
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
           dataService.loadedPosts.removeAtIndex(indexPath.row)
            tableView.reloadData()
           
        }
    }
    
}

