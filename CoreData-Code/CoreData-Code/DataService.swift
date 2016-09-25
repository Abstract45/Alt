//
//  DataService.swift
//  CoreData-Code
//
//  Created by Miwand Najafe on 2016-03-24.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

//
//  DataService.swift
//  Adventure Now
//
//  Created by Miwand Najafe on 2016-03-23.
//  Copyright © 2016 Alexander Besson. All rights reserved.
//

import CoreData
import UIKit


class DataService {
    
    private var _likedPlaces = [LikedPlaces]()
    private let app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var likedPlaces: [LikedPlaces] {
        get {
            return _likedPlaces
        }
        set {
            _likedPlaces = newValue
        }
    }
    
    func loadLikedPlaces() {
        let context = app.managedObjectContext
        let fetchRequests = NSFetchRequest(entityName: "LikedPlaces")
        do {
            let results = try context.executeFetchRequest(fetchRequests)
            self._likedPlaces = results as! [LikedPlaces]
        } catch let err as NSError {
            print(err.debugDescription)
        }
        NSNotificationCenter.defaultCenter().postNotificationName("placesLoaded", object: nil)
    }
    
    func saveLikedPlaces(place:Place) {
        
        let context = app.managedObjectContext
        let entity = NSEntityDescription.entityForName("LikedPlaces", inManagedObjectContext: context)!
        let likedPlace = LikedPlaces(entity: entity, insertIntoManagedObjectContext: context)
        
        let mainImage = getImgFromUrl(place.mainImgUrl)
        let ratingsImage = getImgFromUrl(place.ratingsImgUrl)
        
        likedPlace.name = place.name
        likedPlace.setRatingsImage(ratingsImage)
        likedPlace.setMainImage(mainImage)
        likedPlace.categories = place.categories
        likedPlace.distance = place.distance
        likedPlace.lat = place.lat
        likedPlace.long = place.long
        likedPlace.reviewString = place.reviewString
        likedPlace.reviewSnippet = place.reviewSnippet
        likedPlace.ratings = place.ratings
        likedPlace.phoneNumber = place.phoneNumber
        likedPlace.snippetAddress = place.snippetAddress
        
        
        context.insertObject(likedPlace)
        do {
            try context.save()
        } catch let err as NSError {
            print(err)

}
}
}
