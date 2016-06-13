//
//  RecipeCell.swift
//  Recipez
//
//  Created by Miwand Najafe on 2016-03-23.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(recipe:Recipe) {
        recipeTitle.text = recipe.title
        recipeImg.image = recipe.getRecipeImg()
    }

}
