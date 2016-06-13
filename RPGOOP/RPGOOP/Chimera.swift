//
//  Chimera.swift
//  RPGOOP
//
//  Created by Miwand Najafe on 2016-01-29.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import Foundation

class Chimera: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Silver dagger","Tough hide","Rare trident"]
    }
    
    override var type: String {
        return "Chimera"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        }
        return false
    }
    
    
}