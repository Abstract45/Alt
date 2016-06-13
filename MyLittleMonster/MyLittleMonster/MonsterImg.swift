//
//  MonsterImg.swift
//  MyLittleMonster
//
//  Created by Miwand Najafe on 2016-02-07.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    
    private var imageArray = [UIImage]()
    private var imageDeadArray = [UIImage]()
    
    private var _monsterIdleImg = "idle"
    private var _monsterDeadImg = "dead"
    
    var monsterIdleImg: String {
        get {
            return _monsterIdleImg
        }
        set {
            _monsterIdleImg = newValue
        }
    }
    
    var monsterDeadImg: String {
        get {
            return _monsterDeadImg
        }
        set {
            _monsterDeadImg = newValue
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      
    }
    
    
    
   
    
    func storeImages() {
        imageArray.removeAll()
      print(monsterIdleImg)
        for x in 1...5 {
            
            if x <= 4 {
                if let img = UIImage(named: "\(_monsterIdleImg)\(x).png") {
                    imageArray.append(img)
                }
            }
            
            if let img = UIImage(named: "\(_monsterDeadImg)\(x).png") {
                imageDeadArray.append(img)
            }
        }
    
        animateImgView()
        
    }
    
    func animateImgView() {
        
        self.image = UIImage(named: "\(_monsterIdleImg)1.png")
        
        self.animationImages = imageArray
        self.animationDuration = 0.6
        self.animationRepeatCount = 0
        self.startAnimating()
        
        
    }
    
    func playDeathAnimation() {
        
        self.image = UIImage(named: "\(_monsterDeadImg)5.png")
        
        self.animationImages = imageDeadArray
        self.animationDuration = 0.6
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
    
}