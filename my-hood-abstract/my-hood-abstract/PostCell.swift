//
//  PostCell.swift
//  my-hood-abstract
//
//  Created by Miwand Najafe on 2016-03-13.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView! {
        didSet {
            postImg.imgRoundCorners()
        }
    }
    
    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var postDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configCell(post:Post) {
        postTitle.text = post.title
        postDesc.text = post.postDesc
        postImg.image = DataService.sharedInstance.imageForPath(post.imagePath)
    }
   
}
