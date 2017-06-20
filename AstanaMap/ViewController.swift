//
//  ViewController.swift
//  AstanaMap
//
//  Created by Айдана Токбаева on 6/19/17.
//  Copyright © 2017 Aidana Tokbayeva. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.showsPointsOfInterest = true
        mapView.delegate = self
     
        let place = Place(title: "Nazarbayev University",
                          subtitle: "Qabanbay batyr str. 53",
                          coordinate: CLLocationCoordinate2D(latitude: 51.090305, longitude: 71.398793))
        mapView.addAnnotation(place)
        
        let span = MKCoordinateSpanMake(0.075, 0.075)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.16052, longitude: 71.47036), span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "") {
            annotationView.annotation = annotation
            return annotationView
        } else {
            let annotationView = MKPinAnnotationView(annotation:annotation, reuseIdentifier:"")
            annotationView.isEnabled = true
            annotationView.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView.rightCalloutAccessoryView = btn
            return annotationView
        }
    }

    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotation = view.annotation
        
        let userLocation = mapView.userLocation.location
        
        let annotationLocation = CLLocation(latitude: (annotation?.coordinate.latitude)!, longitude: (annotation?.coordinate.longitude)!)
        
        print(userLocation?.distance(from: annotationLocation) ?? "")
        
        
        
    }
}


