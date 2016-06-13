//
//  UglyCell.swift
//  My-TableView
//
//  Created by Miwand Najafe on 2016-02-26.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class UglyCell: UITableViewCell {

    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        mainImg.layer.cornerRadius = 5.0
        mainImg.clipsToBounds = true
        
    }


    func configCell(image:UIImage, text:String) {
        mainImg.image = image
        mainLbl.text = text
    }
    
    
}
