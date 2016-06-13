//
//  Person.swift
//  DefaultsAreFun
//
//  Created by Miwand Najafe on 2016-03-04.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    var firstName: String!
    var lastName: String!
    
    init(first:String, last:String) {
        firstName = first
        lastName = last
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
      self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        
    }
}