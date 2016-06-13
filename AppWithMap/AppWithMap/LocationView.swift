//
//  SecondViewController.swift
//  AppWithMap
//
//  Created by Miwand Najafe on 2016-03-27.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import MapKit
class LocationView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var map: MKMapView!
    
    let addresses =
    [
        "10690 N De Anza Blvd, Cupertino, CA 95014",
        "10591 N De Anza Blvd, Cupertino, CA 95014",
        "10625 N De Anza Blvd, Cupertino, CA 95014"
    ]
    
    var annotations = [CLLocationCoordinate2D]()
    
    
    //Geocoding - process of taking string based addresses into readable coordinates
    
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 200.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        for add in addresses {
            getPlaceMarkFromAddress(add)
        }
    }

    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    

    
}
extension LocationView: MKMapViewDelegate {
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            map.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    func centerMapOnLocation(location:CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        map.setRegion(coordinateRegion, animated: false)
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        
        if let loc = userLocation.location {
            centerMapOnLocation(loc)
        }
    }
    
    func createAnnotationForLocation(location:CLLocation) {
        let bootcamp = BootCampAnnotations(coordinate: location.coordinate)
        
        map.addAnnotation(bootcamp)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKindOfClass(BootCampAnnotations) {
            let annotView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Default")
            annotView.pinTintColor = UIColor.yellowColor()
            annotView.animatesDrop = true
            return annotView
        } else if annotation.isKindOfClass(MKUserLocation){
            return nil
        }
        return nil
    }
    
    
    func getPlaceMarkFromAddress(address:String) {
        CLGeocoder().geocodeAddressString(address) { (placemarks: [CLPlacemark]?, error: NSError?) in
            if error == nil {
                if let placemarks = placemarks where placemarks.count > 0 {
                    if let location = placemarks[0].location {
                        //We have valid coordinates
                        self.createAnnotationForLocation(location)
                    }
                }
            }
            
        }
    }
}
