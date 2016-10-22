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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchResults()
        vwTable.reloadData()
    }

    func fetchResults() {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.managedObjectContext
        
        let fetchRequests = Recipe.fetchRequest()
        do {
            let results = try context.fetch(fetchRequests)
            self.recipes = results as! [Recipe]
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? RecipeCell {
            cell.configCell(recipe: recipes[indexPath.row])
            return cell
        } else {
            let cell = RecipeCell()
            cell.configCell(recipe: recipes[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    


}

