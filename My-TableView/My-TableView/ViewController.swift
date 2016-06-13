//
//  ViewController.swift
//  My-TableView
//
//  Created by Miwand Najafe on 2016-02-26.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var uglyThings = [String]()
    
    var coolImages = ["http://www8.pcmag.com/media/images/378669-7-cool-things-you-missed-at-sxsw-2013.jpg?thumb=y", "https://pbs.twimg.com/profile_images/654158841307787264/MEoE5XFb.png", "http://media.scoutmagazine.ca/2010/06/mcs-victoria-may-2010-199.jpg", "http://images.radiotimes.com/namedimage/Game_of_Thrones_series_3_trailer_2__seven_cool_things_to_look_out_for.jpg?quality=85&mode=crop&width=620&height=374&404=tv&url=/uploads/images/original/27061.jpg", "http://soulfulprairies.com/wp-content/uploads/2013/12/bee-finger.jpg"]
    
    var coolTitles = ["Grmupy cat", "Cool cat","Weird doll", "Dragon" , "finger"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? UglyCell {
            
            var img: UIImage!
            let url = NSURL(string: coolImages[indexPath.row])!
            if let data = NSData(contentsOfURL: url) {
                 img = UIImage(data: data)
            } else {
                img = UIImage(named: "1")
            }
            
           cell.configCell(img, text: coolTitles[indexPath.row])
            
            return cell
         
        } else {
            return UglyCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coolImages.count
    }

}

