//
//  Vehicles.swift
//  ClassTest
//
//  Created by Miwand Najafe on 2016-01-20.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit


class Vehicle {
    
    private var engine = "4 cylinder"
    private var color = "silver"
    private var _odometer = 0
    
    
    //Getter and setters (accessors and mutators)
    
    var odometer: Int {
        get {
           return _odometer
        }
        set {
            if newValue > _odometer {
                _odometer = newValue
            }
        }
        
    }
    
    
    init(engine:String,color:String) {
        self.engine = engine
        self.color = color
        
    }
    init() {
        
    }
    func enterMiles(miles: Int) {
        _odometer += miles
    }
}