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
    var title: String?
    
    init(categorie:String, title:String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
        self.categorie = categorie
    }
    
    var subtitle: String? {
        return categorie
    }
        
}
