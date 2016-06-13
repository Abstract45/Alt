//
//  ViewController.swift
//  buildingOOPExercise
//
//  Created by Miwand Najafe on 2016-02-04.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var lblRestart: UILabel!
    @IBOutlet weak var lblBattleText: UILabel!
    @IBOutlet weak var leftPlayerHp: UILabel!
    @IBOutlet weak var rightPlayerHp: UILabel!
    @IBOutlet weak var rightPlayerAttack: UIButton!
    @IBOutlet weak var leftPlayerAttack: UIButton!
    var leftPlyrDidAttack: Bool = false
    var rightPlyrDidAttack: Bool = false
    var leftPlyr = Player(hp: 100, attackPower: 10, name: "GOLEM")
    var rightPlyr = Enemy(hp: 110, attackPower: 8, name: "Pantheon")
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        rightPlayerHp.text = "\(rightPlyr.hp) hp"
        leftPlayerHp.text = "\(leftPlyr.hp) hp"
    }

   

    @IBAction func leftPlayerBtn(sender: AnyObject) {
        
        leftPlyrDidAttack = !leftPlyrDidAttack
       
        
        if rightPlyr.isAlive {
      rightPlayerHp.text = "\(leftPlyr.attackTarget(leftPlyr, attackee: rightPlyr)) hp"
        lblBattleText.text = ("\(leftPlyr.name) attacked \(rightPlyr.name) for \(leftPlyr.attackPower) dmg")
        
          
                leftPlayerAttack.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "turnOnLeftBtn", userInfo: nil, repeats: false)
                
                
            
        
        } else {
            matchState(leftPlyr.name, isOver: true)
        }
    }
    
    func turnOnLeftBtn() {
    
        leftPlayerAttack.enabled = true
    }
    
    func turnOnRightBtn() {
        rightPlayerAttack.enabled = true
    }
    
    
    func matchState(playerName:String,isOver:Bool) {
        lblRestart.hidden = !isOver
        restartBtn.hidden = !isOver
        leftPlayerAttack.hidden = isOver
        rightPlayerAttack.hidden = isOver
        if isOver {
        lblBattleText.text = playerName + " has won"
        } else {
            rightPlyr = Enemy(hp: 110, attackPower: 8, name: "Guardian")
            leftPlyr = Player(hp: 100, attackPower: 10, name: "GOLEM")
            rightPlayerHp.text = "\(rightPlyr.hp) hp"
            leftPlayerHp.text = "\(leftPlyr.hp) hp"
            lblBattleText.text = "Let the Battle Begin!"
        }
    }

    @IBAction func rightPlayerBtn(sender: AnyObject) {
        rightPlyrDidAttack = !rightPlyrDidAttack
        
        if leftPlyr.isAlive {
        leftPlayerHp.text = "\(rightPlyr.attackTarget(rightPlyr, attackee: leftPlyr)) hp"
        lblBattleText.text = ("\(leftPlyr.name) attacked \(rightPlyr.name) for \(leftPlyr.attackPower) dmg")
           
            
                rightPlayerAttack.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "turnOnRightBtn", userInfo: nil, repeats: false)
                
                
            
            
            
        } else {
            matchState(rightPlyr.name, isOver: true)
        }
    
    }
    @IBAction func resetPlayers(sender: AnyObject) {
        matchState("", isOver: false)
        
    }
}

