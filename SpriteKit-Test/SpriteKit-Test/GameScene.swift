//
//  GameScene.swift
//  SpriteKit-Test
//
//  Created by Miwand Najafe on 2016-04-02.
//  Copyright (c) 2016 Miwand Najafe. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var barBtn = UIButton()
    var storeBtn = UIButton()
    var qBtn = UIButton()
    var xBtn = UIButton()
    var yBtn = UIButton()
    var zBtn = UIButton()
    var customView = UIView()
   

    
    func createCustomView() {
        customView.frame = CGRect(x: 0, y: 0, width: 225, height: 225)
        customView.backgroundColor = UIColor.orangeColor()
        self.view?.addSubview(customView)
        makeButtons()
    }
    
    func makeButtons() {
        //barbutton
        barBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        barBtn.setTitle("Bar", forState: .Normal)
        barBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        barBtn.backgroundColor = UIColor.blueColor()
        
        //storebutton
        storeBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        storeBtn.setTitle("Store", forState: .Normal)
        storeBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        storeBtn.backgroundColor = UIColor.greenColor()
        
        //qBtn
        qBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        qBtn.setTitle("qBtn", forState: .Normal)
        qBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        qBtn.backgroundColor = UIColor.blackColor()
        
        //xBtn
        xBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        xBtn.setTitle("xBtn", forState: .Normal)
        xBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        xBtn.backgroundColor = UIColor.purpleColor()
        
        //yBtn
        yBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        yBtn.setTitle("yBtn", forState: .Normal)
        yBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        yBtn.backgroundColor = UIColor.grayColor()
        
        //zBtn
        zBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        zBtn.setTitle("zBtn", forState: .Normal)
        zBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        zBtn.backgroundColor = UIColor.darkGrayColor()
        
        addButtons()
        
    }
    
    func addButtons() {
        self.customView.addSubview(barBtn)
        self.customView.addSubview(storeBtn)
        self.customView.addSubview(qBtn)
        self.customView.addSubview(xBtn)
        self.customView.addSubview(yBtn)
        self.customView.addSubview(zBtn)
        addConstraints()
    }
    
    func addConstraints() {
        
        //custom constraint
        
        let customVWCenterConst = NSLayoutConstraint(item: customView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let customVWTopConst = NSLayoutConstraint(item: customView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 100)
        let customVWEqWidth = NSLayoutConstraint(item: customView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0)
        let customVWEqHeight = NSLayoutConstraint(item: barBtn, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0.08, constant: 0)
        let customVWConst = [customVWCenterConst,customVWTopConst,customVWEqWidth,customVWEqHeight]
        
        //barbtn constraint
        let barBtnCenterConst = NSLayoutConstraint(item: barBtn, attribute: .CenterX, relatedBy: .Equal, toItem: customView, attribute: .CenterX, multiplier: 1, constant: 0)
        let barBtnTopConst = NSLayoutConstraint(item: barBtn, attribute: .Top, relatedBy: .Equal, toItem: customView, attribute: .Top, multiplier: 1, constant: 20)
        let barEqWidth = NSLayoutConstraint(item: barBtn, attribute: .Width, relatedBy: .Equal, toItem: customView, attribute: .Width, multiplier: 0.3, constant: 0)
        let barEqHeight = NSLayoutConstraint(item: barBtn, attribute: .Height, relatedBy: .Equal, toItem: customView, attribute: .Height, multiplier: 0.3, constant: 0)
        let barConst = [barBtnCenterConst,barBtnTopConst,barEqWidth,barEqHeight]
        
        //StoreBtn Constraint
        
        let storeLeadingConst = NSLayoutConstraint(item: storeBtn, attribute: .Leading, relatedBy: .Equal, toItem: customView, attribute: .Leading, multiplier: 1, constant: 10)
        let storeTopConst = NSLayoutConstraint(item: storeBtn, attribute: .Top, relatedBy: .Equal, toItem: customView, attribute: .Top, multiplier: 1, constant: 20)
        let storeEqWidth = NSLayoutConstraint(item: storeBtn, attribute: .Width, relatedBy: .Equal, toItem: barBtn, attribute: .Width, multiplier: 1, constant: 0)
        let storeEqHeight = NSLayoutConstraint(item: storeBtn, attribute: .Height, relatedBy: .Equal, toItem: barBtn, attribute: .Height, multiplier: 1, constant: 0)
        
        let storeConst = [storeLeadingConst,storeTopConst,storeEqWidth,storeEqHeight]
        
        //xBtn constraint
        let xBtnCenterConst = NSLayoutConstraint(item: xBtn, attribute: .CenterX, relatedBy: .Equal, toItem: customView, attribute: .CenterX, multiplier: 1, constant: 0)
        let xBtnTopConst = NSLayoutConstraint(item: xBtn, attribute: .Top, relatedBy: .Equal, toItem: barBtn, attribute: .Bottom, multiplier: 1, constant: 20)
        let xBtnEqWidth = NSLayoutConstraint(item: xBtn, attribute: .Width, relatedBy: .Equal, toItem: barBtn, attribute: .Width, multiplier: 1, constant: 0)
        let xBtnEqHeight = NSLayoutConstraint(item: xBtn, attribute: .Height, relatedBy: .Equal, toItem: barBtn, attribute: .Height, multiplier: 1, constant: 0)
        
        let xBtnConst = [xBtnCenterConst,xBtnTopConst,xBtnEqWidth,xBtnEqHeight]
        
        //qBtn Constraint
        let qBtnTrailingConst = NSLayoutConstraint(item: customView, attribute: .Trailing, relatedBy: .Equal, toItem: qBtn, attribute: .Trailing, multiplier: 1, constant: 10)
        let qBtnTopConst = NSLayoutConstraint(item: qBtn, attribute: .Top, relatedBy: .Equal, toItem: customView, attribute: .Top, multiplier: 1, constant: 20)
        let qBtnEqWidth = NSLayoutConstraint(item: qBtn, attribute: .Width, relatedBy: .Equal, toItem: barBtn, attribute: .Width, multiplier: 1, constant: 0)
        let qBtnEqHeight = NSLayoutConstraint(item: qBtn, attribute: .Height, relatedBy: .Equal, toItem: barBtn, attribute: .Height, multiplier: 1, constant: 0)
        
        let qBtnConst = [qBtnTrailingConst,qBtnTopConst,qBtnEqWidth,qBtnEqHeight]
        
        //yBtn Constraint
        let yBtnLeadingConst = NSLayoutConstraint(item: yBtn, attribute: .Leading, relatedBy: .Equal, toItem: customView, attribute: .Leading, multiplier: 1, constant: 10)
        let yBtnTopConst = NSLayoutConstraint(item: yBtn, attribute: .Top, relatedBy: .Equal, toItem: qBtn, attribute: .Bottom, multiplier: 1, constant: 20)
        let yBtnEqWidth = NSLayoutConstraint(item: yBtn, attribute: .Width, relatedBy: .Equal, toItem: barBtn, attribute: .Width, multiplier: 1, constant: 0)
        let yBtnEqHeight = NSLayoutConstraint(item: yBtn, attribute: .Height, relatedBy: .Equal, toItem: barBtn, attribute: .Height, multiplier: 1, constant: 0)
        
        let yBtnConst = [yBtnLeadingConst,yBtnTopConst,yBtnEqWidth,yBtnEqHeight]
        
        //zBtn Constraint
        let zBtnTrailingConst = NSLayoutConstraint(item: customView, attribute: .Trailing, relatedBy: .Equal, toItem: zBtn, attribute: .Trailing, multiplier: 1, constant: 10)
        let zBtnTopConst = NSLayoutConstraint(item: zBtn, attribute: .Top, relatedBy: .Equal, toItem: qBtn, attribute: .Bottom, multiplier: 1, constant: 20)
        let zBtnEqWidth = NSLayoutConstraint(item: zBtn, attribute: .Width, relatedBy: .Equal, toItem: barBtn, attribute: .Width, multiplier: 1, constant: 0)
        let zBtnEqHeight = NSLayoutConstraint(item: zBtn, attribute: .Height, relatedBy: .Equal, toItem: barBtn, attribute: .Height, multiplier: 1, constant: 0)
        let zBtnConst = [zBtnTrailingConst,zBtnTopConst,zBtnEqWidth,zBtnEqHeight]
        
        let allConstraints = [customVWConst,barConst,storeConst,xBtnConst,yBtnConst,zBtnConst,qBtnConst].flatten().flatMap({$0})
        
        NSLayoutConstraint.activateConstraints(allConstraints)
        turnOffAutoResizeMask()
        
    }
    
    func turnOffAutoResizeMask() {
        /*
         We need to disable the auto resizing masks for all the views to prevent constraints getting
         automatically based on the autoResizingMask property. The autoResizingMask property is set to
         true when the views are added programmtically added so we need make sure that this property for
         all these views are set to false.
         */
        
        barBtn.translatesAutoresizingMaskIntoConstraints = false
        storeBtn.translatesAutoresizingMaskIntoConstraints = false
        xBtn.translatesAutoresizingMaskIntoConstraints = false
        qBtn.translatesAutoresizingMaskIntoConstraints = false
        yBtn.translatesAutoresizingMaskIntoConstraints = false
        zBtn.translatesAutoresizingMaskIntoConstraints = false
        customView.translatesAutoresizingMaskIntoConstraints = false
    }
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      createCustomView()
    }
    
   
   
    
}
