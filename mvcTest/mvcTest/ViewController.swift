//
//  ViewController.swift
//  mvcTest
//
//  Created by Miwand Najafe on 2016-02-09.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(first: "hon", last: "da")
    }

    //put code that modifies view layout if viewWillAppear doesn't work
    override func viewDidLayoutSubviews() {
    
    }

}

