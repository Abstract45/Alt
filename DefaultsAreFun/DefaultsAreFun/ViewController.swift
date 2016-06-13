//
//  ViewController.swift
//  DefaultsAreFun
//
//  Created by Miwand Najafe on 2016-03-04.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var favLabel: UILabel!

    var people = [Person]()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let color = defaults.valueForKey("color") as? String {
            favLabel.text = "Favourite Color: \(color)"
        } else {
            favLabel.text = "Pick a color!"
        }
        
        let personA = Person(first:"Wing",last:"Chun")
        let personB = Person(first:"lady", last:"Gaga")
        let personC = Person(first:"muffin", last: "Bieber")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        defaults.setObject(peopleData, forKey: "people")
        defaults.synchronize()
        
    }

   

    @IBAction func yellow(sender: AnyObject) {
        favLabel.text = "Favourite Color : Yellow"
        saveMyColor("Yellow")
    }

    @IBAction func red(sender: AnyObject) {
        favLabel.text = "Favourite colour : Red"
        saveMyColor("Red")
    }

    @IBAction func blue(sender: AnyObject) {
        favLabel.text = "Favourite colour : blue"
        saveMyColor("Blue")
        
    }
    
    func saveMyColor(color: String) {
        
        if let loadedPeople = defaults.objectForKey("people") as? NSData {
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
        
        
        NSUserDefaults.standardUserDefaults().setValue(color, forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

