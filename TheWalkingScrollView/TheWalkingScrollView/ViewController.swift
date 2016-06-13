//
//  ViewController.swift
//  TheWalkingScrollView
//
//  Created by Miwand Najafe on 2016-03-04.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!

    let WIDTH: CGFloat = 240
    let HEIGHT: CGFloat = 397
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...5 {
            let img = UIImage(named: "\(i)")
            let imgView = UIImageView(image: img)
            
            scrollView.addSubview(imgView)
            
            imgView.frame = CGRect(x: -WIDTH + (WIDTH * (CGFloat(i))), y: 350, width: WIDTH, height: HEIGHT)
            
            scrollView.contentSize = CGSize(width: WIDTH * 5, height: scrollView.frame.size.height)
        }
        
        
    }

   


}

