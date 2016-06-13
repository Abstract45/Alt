//
//  BlueButton.swift
//  customViews
//
//  Created by Miwand Najafe on 2016-02-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class BlueButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = UIColor(red: 46/255, green: 135/255, blue: 195/255, alpha: 1)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
}
