//
//  Enemy.swift
//  buildingOOPExercise
//
//  Created by Miwand Najafe on 2016-02-04.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class Enemy: CharacterType {
    
    private var _name = "Grunt"
    
    var name:String {
        return _name
    }
    
    convenience init(hp:Int,attackPower:Int,name:String) {
        self.init(hp: hp, attackPwr: attackPower)
        self._name = name
    }
    
}
