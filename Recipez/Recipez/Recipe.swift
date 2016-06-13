//
//  Recipe.swift
//  Recipez
//
//  Created by Miwand Najafe on 2016-03-23.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import CoreData

@objc(Recipe)
class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    func setRecipeImage(img:UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImg() -> UIImage {
        let img = UIImage(data: self.image!)
        return img!
    }
}
