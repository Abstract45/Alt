//
//  Player.swift
//  RPGOOP
//
//  Created by Miwand Najafe on 2016-01-29.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name: String = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    func addItemToInventory(item:String) {
        _inventory.append(item)
    }
    
    convenience init(startingHp: Int, attackPwr: Int, name:String) {
        self.init(startingHp: startingHp, attackPwr: attackPwr)
        _name = name
        
    }
}