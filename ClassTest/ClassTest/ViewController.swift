//
//  ViewController.swift
//  ClassTest
//
//  Created by Miwand Najafe on 2016-01-20.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var bmw = Vehicle()
       print(bmw.odometer)
        bmw.odometer = 200
        print(bmw.odometer)
        
        
    }

   

}

