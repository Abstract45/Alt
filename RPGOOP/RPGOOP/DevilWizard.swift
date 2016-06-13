//
//  DevilWizard.swift
//  RPGOOP
//
//  Created by Miwand Najafe on 2016-01-29.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Devil horn","Dark amulet","food"]
    }
    
    override var type:String {
        return "Devil Wizard"
    }
}