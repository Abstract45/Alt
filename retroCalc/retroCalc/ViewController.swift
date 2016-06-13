//
//  ViewController.swift
//  retroCalc
//
//  Created by Miwand Najafe on 2016-01-17.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
   
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    
    
    
    var btnSound: AVAudioPlayer!
    
   var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    var currentOpertation:Operation = Operation.Empty
    @IBOutlet weak var outputLbl: UILabel!
    @IBAction func numberPressed(btn:UIButton) {
        
        playSound()
        
        runningNumber += "\(btn.tag)"
        
      outputLbl.text = runningNumber
        
    }
    
    @IBAction func onSubtractPressed(sender:AnyObject) {
       processOperation(Operation.Subtract)
    }
    @IBAction func onAddPressed(sender:AnyObject) {
        processOperation(Operation.Add)
    }
    @IBAction func onMultiplyPressed(sender:AnyObject) {
        processOperation(Operation.Multiply)
    }
    @IBAction func onDivideressed(sender:AnyObject) {
        processOperation(Operation.Divide)
    }
    @IBAction func onEqualPressed(sender:AnyObject) {
        processOperation(currentOpertation)
    }
    
    @IBAction func clearCalc(sender: AnyObject) {
        
        
        leftValStr = ""
        rightValStr = ""
        result = ""
        runningNumber = ""
        currentOpertation = Operation.Empty
        outputLbl.text = "0"
    }
    func processOperation (op: Operation) {
        playSound()
        
        if currentOpertation != Operation.Empty {
            
            if runningNumber != "" {
          rightValStr = runningNumber
            runningNumber = ""
            
            if currentOpertation == Operation.Multiply {
             result = "\(Int(leftValStr)! * Int(rightValStr)!)"
            } else if currentOpertation == Operation.Divide {
                result = "\(Int(leftValStr)! / Int(rightValStr)!)"
            } else if currentOpertation == Operation.Add {
                result = "\(Int(leftValStr)! + Int(rightValStr)!)"
            } else if currentOpertation == Operation.Subtract {
                result = "\(Int(leftValStr)! - Int(rightValStr)!)"
                
            }
            outputLbl.text = result
            leftValStr = result
            
            
        }
            currentOpertation = op
        } else {
           leftValStr = runningNumber
            runningNumber = ""
            currentOpertation = op
        }
        
    }
    func playSound() {
        if btnSound.playing {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        do {
            btnSound = try AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch let error as NSError{
            print(error.debugDescription)
        }
    }
    
    
    
    
    
}

