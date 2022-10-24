//
//  ViewController.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 20/10/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var savePlaceOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        savePlaceOutlet.layer.cornerRadius = 10
    }

    @IBAction func SavePlaceButton(_ sender: UIButton) {
    }
    
}

