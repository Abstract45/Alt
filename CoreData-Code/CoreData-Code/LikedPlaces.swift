//
//  LikedPlaces.swift
//  CoreData-Code
//
//  Created by Miwand Najafe on 2016-03-24.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import CoreData


class LikedPlaces: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    
    func setMainImage(img:UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.mainImg = data
    }
    
    
    func getMainImg() -> UIImage {
        let img = UIImage(data: self.mainImg!)
        return img!
    }
    func setRatingsImage(img:UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.rateImg = data
    }
    
    func getRatingsImg() -> UIImage {
        let img = UIImage(data: self.rateImg!)
        return img!
    }
}
extension LikedPlaces {
    
    @NSManaged var name: String?
    @NSManaged var lat: NSNumber?
    @NSManaged var long: NSNumber?
    @NSManaged var snippetAddress: String?
    @NSManaged var ratings: NSNumber?
    @NSManaged var reviewSnippet: String?
    @NSManaged var fullAddress: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var distance: String?
    @NSManaged var categories: String?
    @NSManaged var reviewString: String?
    @NSManaged var mainImg: NSData?
    @NSManaged var rateImg: NSData?
    
}
// Card deck VC under like button
//testService.saveLikedPlaces(lPlace)
//Adventure vc
// NSNotificationCenter.defaultCenter().removeObserver(self, name: "", object: nil)
// func reloadTable() {
//tblListTable.reloadData()
//}
//testService.loadLikedPlaces()
//        cell.lblName.text = testService.likedPlaces[indexPath.row].name!
//cell.lblAddress.text = testService.likedPlaces[indexPath.row].snippetAddress!
//cell.lblNumberOfReviews.text = testService.likedPlaces[indexPath.row].reviewString!
//cell.lblIndex.text = "\(indexPath.row + 1)"
//cell.lblCategories.text = testService.likedPlaces[indexPath.row].categories!
//cell.imgMain.image = testService.likedPlaces[indexPath.row].getMainImg()
//cell.imgReviews.image = testService.likedPlaces[indexPath.row].getRatingsImg()

