//
//  ViewController.swift
//  Enums
//
//  Created by Miwand Najafe on 2016-02-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Cars: Int {
        case BMW = 1
        case HONDA = 2
        case TESLA = 3
        case SUBARU = 0
    }

    @IBOutlet weak var updateLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onBtnTapped(sender: AnyObject) {
        
        if sender.tag == Cars.BMW.rawValue {
            updateLbl.text = "BMW is awesome"
        } else if sender.tag == Cars.HONDA.rawValue {
            updateLbl.text = "Bad Honda"
        } else if sender.tag == Cars.TESLA.rawValue {
            updateLbl.text = "New Block in the hood"
        } else {
            updateLbl.text = "BOOOO a subu"
        }
    }
    

}

