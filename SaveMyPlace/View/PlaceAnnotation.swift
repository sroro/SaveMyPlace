//
//  PlaceAnnotation.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 07/11/2022.
//


import UIKit
import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var categorie: String
    var name: String?
    
    init(categorie:String, name:String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.name = name
        self.categorie = categorie
    }
    
    
}
