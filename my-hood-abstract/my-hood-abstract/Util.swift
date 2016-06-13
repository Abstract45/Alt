//
//  Util.swift
//  my-hood-abstract
//
//  Created by Miwand Najafe on 2016-03-13.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func imgRoundCorners() {
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
}