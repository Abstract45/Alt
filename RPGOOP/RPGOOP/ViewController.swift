//
//  ViewController.swift
//  RPGOOP
//
//  Created by Miwand Najafe on 2016-01-29.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBAction func BtnTreasure(sender: AnyObject) {
        
        treasureBtn.hidden = true
        lblPrint.text = chestMsg
        
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "generateRandEnemy", userInfo: nil, repeats: false)
        
      
    }
    @IBOutlet weak var lblPlayerHp: UILabel!
  
    @IBOutlet weak var lblPrint: UILabel!
    
    @IBOutlet weak var lblEnemy: UILabel!
    
    
    
    
    @IBOutlet weak var treasureBtn: UIButton!
    @IBOutlet weak var imgEnemy: UIImageView!
    
    var player: Player!
    var enemy: Enemy!
    var chestMsg: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player(startingHp: 101, attackPwr: 20, name: "WhatWhat")
        generateRandEnemy()
        lblPlayerHp.text = "\(player.hp)"
        
        
    }
    
    @IBAction func btnAttemptAttack(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
        lblPrint.text = "Attacked \(enemy.type) for \(player.attackPwr)"
            lblEnemy.text = "\(enemy.hp) HP"
        } else {
            lblPrint.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            chestMsg = "\(player.name) got \(loot)"
            treasureBtn.hidden = false
              player.addItemToInventory(loot)
        }
        
        if !enemy.isAlive {
            lblEnemy.text = ""
            imgEnemy.hidden = true
            lblPrint.text = "\(enemy.type) has been vanquished"
        }
        
    }
    func generateRandEnemy() {
        let rand = arc4random_uniform(2)
        if rand == 0 {
            enemy = Chimera(startingHp: 100, attackPwr:  5)
            
            imgEnemy.image = UIImage(named: "enem1")
        } else {
            enemy = DevilWizard(startingHp: 75, attackPwr:  10)
            imgEnemy.image = UIImage(named: "enem2")
        }
        lblEnemy.text = "\(enemy.hp) HP"
        imgEnemy.hidden = false
    }

    

}

