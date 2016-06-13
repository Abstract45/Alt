//
//  ViewController.swift
//  FavouritePlaces
//
//  Created by Miwand Najafe on 2016-02-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moreBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       moreBtn.layer.cornerRadius = 2.0
        moreBtn.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

