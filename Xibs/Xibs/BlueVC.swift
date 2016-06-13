//
//  BlueVC.swift
//  Xibs
//
//  Created by Miwand Najafe on 2016-02-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class BlueVC: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    var printTxt = ""
    
    
    convenience init(printMe:String) {
        self.init(nibName: "BlueVC", bundle: nil)
        printTxt = printMe
       
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        myLabel.text = printTxt
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
