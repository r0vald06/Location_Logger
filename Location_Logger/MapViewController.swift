//
//  MapViewController.swift
//  Location_Logger
//
//  Created by raudel Valdes on 11/28/18.
//  Copyright © 2018 Raudel Valdes. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "location.png") as UIImage?
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.frame = CGRect(x: 20, y: 550, width: 100, height: 100)
        button.setImage(image, for: .normal)

        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false //to be able to add constraint
        
        self.view.addSubview(button)

        let marginsCopy = view.layoutMarginsGuide
        let buttonConstraintCopy = button.bottomAnchor.constraint(equalTo: marginsCopy.bottomAnchor, constant: 0)
        let leadingConstraintCopy = button.leftAnchor.constraint( equalTo: marginsCopy.leftAnchor, constant: 0)


        buttonConstraintCopy.isActive = true
        leadingConstraintCopy.isActive = true
        
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        mapView.delegate = self
        mapView.showsUserLocation = true
        let locationManager = CLLocationManager()
        
        
        if (CLLocationManager.locationServicesEnabled())
        {
            if CLLocationManager.authorizationStatus() == .restricted ||
                CLLocationManager.authorizationStatus() == .denied ||
                CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            self.locationManager = locationManager
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
            
        } else {
            print("please turn on location services or GPS")
        }
        
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation,latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: false)
        }
    }
    
    override func loadView() {
        //create a map view
        mapView = MKMapView()
        
        //set it as the *the* view of this controller
        view = mapView
        
        let standardString = NSLocalizedString("standard", comment: "standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridSting = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridSting])
        
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
}
