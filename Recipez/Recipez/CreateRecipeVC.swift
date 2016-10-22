//
//  CreateRecipeVC.swift
//  Recipez
//
//  Created by Miwand Najafe on 2016-03-23.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var recipeTitle:UITextField!
    @IBOutlet weak var recipeIngredients:UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var addReceipeBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImg.layer.cornerRadius = 4
        recipeImg.clipsToBounds = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        recipeImg.image = selectedImage
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImage(sender:AnyObject!) {
        present(imagePicker, animated:true,completion:nil)
    }
    @IBAction func createRecipe(sender:AnyObject!) {
        if let title = recipeTitle.text , title != "" {
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)!
            let recipe = Recipe(entity: entity, insertInto: context)
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(img: recipeImg.image!)
            context.insert(recipe)
            do {
                try context.save()
            } catch let err as NSError {
                print(err)
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
  
}
