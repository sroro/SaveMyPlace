//
//  ViewController.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 20/10/2022.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var savePlaceOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        StartLocation()
       StartLocation()
        savePlaceOutlet.layer.cornerRadius = 10
    }
    
 
    
    
    //     Step 2: Declare a CLLocationManager
    let locationManager = CLLocationManager()
    var location : CLLocation?
    var performingReverseGeocoding = false
    var lastGeocodingError: Error?
    var arrayPostal : CLPlacemark?
    
    @IBAction func SavePlaceButton(_ sender: UIButton) {
        StartLocation()
        getPlacemark(location: location!)
        
        print("ici",location)
        print("la",arrayPostal)
        performSegue(withIdentifier: "segueToSave", sender: nil)
     
    }
    
    
    func StartLocation(){
        // Step 3: initalise and configure CLLocationManager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        
        // Step 4: request authorization
        let authStatus = locationManager.authorizationStatus
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
      
}


}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailError \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation = locations.last!
        location = newLocation
     
        
        //stop updateLocation after 1 coordonnées
        if locations.count == 1 {
            locationManager.stopUpdatingLocation()
        }

    }
    
    private func getPlacemark(location: CLLocation) {
           CLGeocoder().reverseGeocodeLocation(location) { places, error in
               guard error == nil else {
                   return
               }

               guard let firstPlace = places?.first else {return}
    
               self.arrayPostal = firstPlace
 
           }
       }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSave" {
            let vcDestination = segue.destination as? SaveInformationViewController
            vcDestination?.coordonnésGPS = location
        }
    }
}

