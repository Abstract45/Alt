//
//  CustomBtn.swift
//  MyFavPlace
//
//  Created by Miwand Najafe on 2016-02-10.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class CustomBtn: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        cutCorners()
        adjustFont()
        setBtnColor()
       
    }
    
    func cutCorners() {
        self.layer.cornerRadius = 2
        self.clipsToBounds = true
    }
    
    func adjustFont() {
        self.titleLabel?.textColor = UIColor.whiteColor()
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
       
        
   
      
    }
    
    func setBtnColor() {
        self.backgroundColor = UIColor.redColor()
    }
    
    
}

