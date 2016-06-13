//
//  YellowVC.swift
//  Nav-Controller
//
//  Created by Miwand Najafe on 2016-03-04.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class YellowVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func popMe(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
}
