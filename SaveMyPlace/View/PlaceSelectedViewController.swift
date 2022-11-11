//
//  PlaceSelectedViewController.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 11/11/2022.
//

import UIKit
import MapKit
import CoreData

class PlaceSelectedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        titlePlace.text = placeSelected[0].title
        categoriePlace.text = ("Catégorie: \(placeSelected[0].categorie ?? "")")
        imagePlace.image = UIImage(data: placeSelected[0].image!)
        adressPlace.text = placeSelected[0].adresse
        // Do any additional setup after loading the view.
        getPlaceAnnotation()
       setZoomPlaceSelected()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }

    @IBOutlet weak var categoriePlace: UILabel!
    @IBOutlet weak var titlePlace: UILabel!
    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var adressPlace: UILabel!
    @IBOutlet weak var mapPlace: MKMapView!
    
    
    var placeSelected = [Place]()
    var placeSelecteAnnotation: MKAnnotation?
    
    func getPlaceAnnotation(){
        placeSelecteAnnotation = PlaceAnnotation(categorie: placeSelected[0].categorie ?? "", title: placeSelected[0].title ?? "", coordinate: CLLocationCoordinate2D(latitude: placeSelected[0].latitudes, longitude: placeSelected[0].longitudes))
        mapPlace.addAnnotation(placeSelecteAnnotation!)
    }
    
    func setZoomPlaceSelected(){
        //set zoom on current position
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location = CLLocationCoordinate2D(latitude:  placeSelected[0].latitudes, longitude: placeSelected[0].longitudes)
        let region = MKCoordinateRegion(center: location, span: span)
        mapPlace.setRegion(region, animated: true)
    }
}


