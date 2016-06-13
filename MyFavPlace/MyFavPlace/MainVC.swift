//
//  MainVC.swift
//  MyFavPlace
//
//  Created by Miwand Najafe on 2016-02-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var aboutTdotBtn: CustomBtn!
    @IBOutlet weak var photosBtn: CustomBtn!
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.layoutIfNeeded()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
