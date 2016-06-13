//
//  BootCampAnnotations.swift
//  AppWithMap
//
//  Created by Miwand Najafe on 2016-03-31.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import Foundation
import MapKit

class BootCampAnnotations: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
}
