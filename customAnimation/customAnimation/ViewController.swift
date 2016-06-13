//
//  ViewController.swift
//  customAnimation
//
//  Created by Miwand Najafe on 2016-04-13.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewz: UIView?
    var view2: UIView?
    var view3: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       drawMyShit()
    }

    func drawMyShit() {
         viewz = UIView(frame: CGRect(x: 10, y: 30, width: 40, height: 10))
         view2 = UIView(frame: CGRect(x: 10, y: 45, width: 40, height: 10))
         view3 = UIView(frame: CGRect(x: 10, y: 60, width: 40, height: 10))
        viewz!.backgroundColor = UIColor.redColor()
        view2!.backgroundColor = UIColor.blueColor()
        view3!.backgroundColor = UIColor.brownColor()
        self.view.addSubview(viewz!)
        self.view.addSubview(view2!)
        self.view.addSubview(view3!)
    }
    
    func changeMyShit() {
        viewz = UIView(frame: CGRect(x: 10, y: 30, width: 20, height: 10))
    }

}

