//
//  Place.swift
//  AstanaMap
//
//  Created by Айдана Токбаева on 6/19/17.
//  Copyright © 2017 Aidana Tokbayeva. All rights reserved.
//

import Foundation

import MapKit

class Place: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    var title: String?
    var subtitle: String?

    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
       
        
        super.init()
    }
    
  
}
