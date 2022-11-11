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
        imagePlace.image = UIImage(data: placeSelected[0].image!)
        adressPlace.text = placeSelected[0].adresse
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }

    @IBOutlet weak var categoriePlace: UILabel!
    @IBOutlet weak var titlePlace: UILabel!
    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var adressPlace: UILabel!
    @IBOutlet weak var mapPlace: MKMapView!
    
    
    var placeSelected = [Place]()
}


