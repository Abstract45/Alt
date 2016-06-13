//
//  ViewController.swift
//  MyLittleMonster
//
//  Created by Miwand Najafe on 2016-02-07.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var replayBtnView: UIButton!
    @IBOutlet weak var penalty3Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImage!
    @IBOutlet weak var heartImg: DragImage!
    @IBOutlet weak var monsterHeight: NSLayoutConstraint!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer!
    var monsterHappy = false
    var currentItem: UInt32 = 0
    
    var golemType = ""
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchGolem(golemType)
        getSounds()
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        penalty3Img.alpha = DIM_ALPHA
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        startTimer()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onObjectDropped", object: nil)
    }
    
    func switchGolem(golem:String) {
        
        if golem == "shortRock" {
            monsterImg.monsterIdleImg = "idled"
            monsterImg.monsterDeadImg = "deadd"
            
        monsterHeight.constant = 262
        }
        monsterImg.storeImages()
    }
    
    
    func getSounds(){
        do {
            try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxSkull.prepareToPlay()
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    func itemDroppedOnCharacter(notification:NSNotification) {
        monsterHappy = true
        startTimer()
        
        print(currentItem)
        if currentItem == 0 {
            sfxHeart.play()
        } else {
            sfxBite.play()
        }
        
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
    }
    
    func startTimer() {
        
        if timer != nil {
            timer.invalidate()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
    }
    
    func changeGameState() {
        
        if !monsterHappy {
            penalties++
            
            sfxSkull.play()
            
            if penalties == 1 {
                penalty1Img.alpha = OPAQUE
                
            } else if penalties == 2 {
                
                penalty2Img.alpha = OPAQUE
                
            } else if penalties == 3 {
                
                penalty3Img.alpha = OPAQUE
            } else {
                penalty1Img.alpha = DIM_ALPHA
                penalty2Img.alpha = DIM_ALPHA
                penalty3Img.alpha = DIM_ALPHA
            }
            
            if penalties >= MAX_PENALTIES {
                
                gameOver()
                
            }
        }
        
        let rand = arc4random_uniform(2)
        
        if rand == 0 {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
            
        } else {
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
            
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
        }
        
        currentItem = rand
        monsterHappy = false
    }
    
    
    @IBAction func replayBtnAction(sender: AnyObject) {
        replayBtnView.hidden = true
        penalties = 0
        startTimer()
        monsterImg.animateImgView()
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        penalty3Img.alpha = DIM_ALPHA
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImg.playDeathAnimation()
        sfxDeath.play()
        replayBtnView.hidden = false
    }
}

