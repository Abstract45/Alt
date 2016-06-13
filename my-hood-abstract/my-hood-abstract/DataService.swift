//
//  DataService.swift
//  my-hood-abstract
//
//  Created by Miwand Najafe on 2016-03-13.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import Foundation
import UIKit

 final class DataService {
    static let sharedInstance = DataService()
    let KEY_POSTS = "posts"
    private var _loadedPosts = [Post]()
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var loadedPosts: [Post] {
        get {
        return _loadedPosts
        }
        set {
            _loadedPosts = newValue
        }
    }
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        defaults.setObject(postsData, forKey: KEY_POSTS)
        defaults.synchronize()
    }
    
    func loadPosts() {
        if let postsData = defaults.objectForKey(KEY_POSTS) as? NSData {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        NSNotificationCenter.defaultCenter().postNotificationName("postsLoaded", object: nil)
    }
    
    func saveImageAndCreatePath(image:UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path:String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post:Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name:String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let fullPath = paths[0] as? NSString {
            return fullPath.stringByAppendingPathComponent(name)
        }
    }
    
}