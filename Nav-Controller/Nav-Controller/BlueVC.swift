//
//  BlueVC.swift
//  Nav-Controller
//
//  Created by Miwand Najafe on 2016-03-04.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class BlueVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goHome(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }

}
