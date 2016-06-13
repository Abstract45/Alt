//
//  ViewController.swift
//  CalcPractice
//
//  Created by Miwand Najafe on 2016-01-18.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var runningNumber = ""
    var lftNumber = ""
    var rightNumber = ""
    var results = ""
    var currentOp = 0
    
    
    @IBOutlet weak var lblOutput: UILabel!
    
    @IBAction func buttonPressed(btn:UIButton) {
        
        if btn.tag == (10...15).filter({$0 == btn.tag}).minElement() {
            
            doMath(btn.tag)
            
        } else {
            
            
            runningNumber += btn.tag.description
            
        }
        lblOutput.text = runningNumber
    }
    
    
    func doMath(op:Int) {
        
        if currentOp != 0 {
            
            if runningNumber != "" {
                rightNumber = runningNumber
                runningNumber = ""
                
                switch currentOp {
                case 10:
                    results = "\(Int(lftNumber)! / Int(rightNumber)!)"
                    
                case 11:
                    results = "\(Int(lftNumber)! * Int(rightNumber)!)"
                    
                case 12:
                    results = "\(Int(lftNumber)! - Int(rightNumber)!)"
                    
                case 13:
                    results = "\(Int(lftNumber)! + Int(rightNumber)!)"
                    
                    
                case 15:
                    
                    lblOutput.text = "0"
                    rightNumber = ""
                    lftNumber = ""
                    
                    results = ""
                    runningNumber = ""
                default:
                    lblOutput.text = results
                    
                }
             lblOutput.text = results
            }
            
        } else {
            lftNumber = runningNumber
            runningNumber = ""
            currentOp = op
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

