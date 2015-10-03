//
//  MapViewController.swift
//  MutiApp
//
//  Created by 孟若 on 15/9/22.
//  Copyright © 2015年 孟若. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate{

    var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: self.view.bounds)
        self.view.addSubview(mapView)
        mapView.userTrackingMode = MKUserTrackingMode.Follow
        self.view.backgroundColor = UIColor.orangeColor()
        mapView.delegate = self
        createAnnotationWithCoords()
        
    }
    
    var tempRest: Rest?
    var rest : Rest {
        set(newRest){
            tempRest = newRest
        }
        
        get{
            return tempRest!
        }
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        var annotionView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
        if annotionView == nil{
            annotionView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotionView!.canShowCallout = true
        }
        let leftCoinView = UIImageView(frame: CGRectMake(0, 0, 50, 50))
        leftCoinView.image = UIImage(named: tempRest!.image)
        leftCoinView.contentMode = UIViewContentMode.ScaleAspectFill
        leftCoinView.clipsToBounds  = true
        annotionView!.leftCalloutAccessoryView = leftCoinView
        return annotionView!
    }
    
    func createAnnotationWithCoords(){
        CLGeocoder().geocodeAddressString((tempRest?.location)!, completionHandler: {
            (placemarks : [CLPlacemark]? , error : NSError?) -> Void in
            if placemarks != nil && placemarks!.count > 0 {
                let placemark = placemarks![0] as CLPlacemark//向下转型
                
                // 大头针的效果
                let annotation = MKPointAnnotation()
                annotation.title = self.rest.name
                annotation.subtitle = self.rest.type
                annotation.coordinate = placemark.location!.coordinate
                
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
        })
    
    }
}
