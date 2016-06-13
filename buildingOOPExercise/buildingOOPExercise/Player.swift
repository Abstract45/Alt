//
//  Player.swift
//  buildingOOPExercise
//
//  Created by Miwand Najafe on 2016-02-04.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class Player: CharacterType {
    private var _name: String = "Steve"
    
    
     var name: String {
        return _name
    }
    override var hp: Int {
        return 100
    }
    
    convenience init(hp:Int,attackPower:Int,name:String) {
        self.init(hp: hp, attackPwr: attackPower)
        self._name = name
    }
    
}
