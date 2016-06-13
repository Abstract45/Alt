//
//  ViewController.swift
//  Recipez
//
//  Created by Miwand Najafe on 2016-03-23.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var vwTable: UITableView!
    
    var recipes = [Recipe]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchResults()
        vwTable.reloadData()
    }

    func fetchResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequests = NSFetchRequest(entityName: "Recipe")
        do {
            let results = try context.executeFetchRequest(fetchRequests)
            self.recipes = results as! [Recipe]
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? RecipeCell {
            cell.configCell(recipes[indexPath.row])
            return cell
        } else {
            let cell = RecipeCell()
            cell.configCell(recipes[indexPath.row])
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    


}

