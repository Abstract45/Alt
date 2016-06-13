//
//  CharacterType.swift
//  buildingOOPExercise
//
//  Created by Miwand Najafe on 2016-02-04.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class CharacterType {
   private var _hp = 100
   private var _attackPower = 10
 
    
    var hp: Int {
        return _hp
    }
    
    var isAlive: Bool{
        if self._hp <= 0 {
            return false
        } else {
            return true
        }
    }
    
    var attackPower: Int {
        return _attackPower
    }
    
    init(hp:Int,attackPwr:Int) {
        self._hp = hp
        self._attackPower = attackPwr
    }
    
    
    
    func attackTarget(attacker: CharacterType, attackee:CharacterType) -> String  {
       attackee._hp -= attacker.attackPower
        self.hp
        return String(attackee._hp)
    }
}
