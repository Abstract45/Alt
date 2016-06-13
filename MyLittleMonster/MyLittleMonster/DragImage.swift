//
//  DragImage.swift
//  MyLittleMonster
//
//  Created by Miwand Najafe on 2016-02-07.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import Foundation

class DragImage: UIImageView {
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPoint(x: position.x, y: position.y)
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        if let touch = touches.first, let target = dropTarget {
            
            let position = touch.locationInView(self.superview)
            if CGRectContainsPoint(target.frame, position) {
                NSNotificationCenter.defaultCenter().postNotificationName("onObjectDropped", object: nil)
            }
        }
        
        self.center = originalPosition
    }
    
    
    
}

