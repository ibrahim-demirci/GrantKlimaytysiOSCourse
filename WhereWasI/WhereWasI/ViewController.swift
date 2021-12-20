//
//  ViewController.swift
//  WhereWasI
//
//  Created by İbrahim Demirci on 19.12.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        UpdateSavedPin()
        
    }
    
    func UpdateSavedPin() {
        if let oldCoords = DataStore().GetLastLocation() {
            
            
            let annoRem = mapView.annotations.filter{$0 !== mapView.userLocation}
            mapView.removeAnnotations(annoRem)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(oldCoords.latitude)!
            annotation.coordinate.longitude = Double(oldCoords.longitude)!
            
            annotation.title = "I was here!"
            annotation.subtitle = "Remember?"
            
            mapView.addAnnotation(annotation)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            print("Location not enabled")
            return
        }
        print("Location allowed")
        mapView.showsUserLocation = true
    }

    
    @IBAction func SaveButtonClicked(_ sender: Any) {
        let coordinate = locationManager.location?.coordinate
        
        if let latitude = coordinate?.latitude {
            if let longitude = coordinate?.longitude {
                DataStore().StoreDataPoint(latitude: String(latitude), longitude: String(longitude))
                
                UpdateSavedPin()
            }
        }
        
        
    }
    
}

