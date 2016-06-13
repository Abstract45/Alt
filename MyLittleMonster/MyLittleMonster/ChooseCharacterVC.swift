//
//  ChooseCharacterVC.swift
//  MyLittleMonster
//
//  Created by Miwand Najafe on 2016-02-09.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ChooseCharacterVC: UIViewController {
    
    
    var monsterType: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func pudgyGolem(sender: AnyObject) {
        
        monsterType = "shortRock"
        self.performSegueWithIdentifier("segueToGame", sender: self)
        
    }
    
    @IBAction func strongGolem(sender: AnyObject) {
        monsterType = "bigRock"
        self.performSegueWithIdentifier("segueToGame", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToGame" {
            let destinationVC = segue.destinationViewController as! ViewController
     
            destinationVC.golemType = monsterType
            
            
        }
    }
    
}
