//
//  SecondVC.swift
//  NoStoryBoardEx
//
//  Created by Miwand Najafe on 2016-02-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goToGreen(sender: AnyObject) {
        
        let greenVC = ThirdVC(nibName: "ThirdVC", bundle: nil)
        self.presentViewController(greenVC, animated: true, completion: nil)
        
    }
    
    @IBAction func goBackOne(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
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
