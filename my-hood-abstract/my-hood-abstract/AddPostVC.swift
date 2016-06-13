//
//  AddPostVC.swift
//  my-hood-abstract
//
//  Created by Miwand Najafe on 2016-03-13.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView! {
        didSet {
           postImg.imgRoundCorners()
        }
    }
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    
    var imgPicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
    }

    @IBAction func addPicBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
   
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    @IBAction func makePostBtnPressed(sender: UIButton) {
        if let title = titleField.text,
        desc = descField.text,
        img = postImg.image {
            
            let imgPath = DataService.sharedInstance.saveImageAndCreatePath(img)
                let post = Post(imagePath: imgPath, title: title, description: desc)
                DataService.sharedInstance.addPost(post)
                dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }
    
    
}
