//
//  SaveInformationViewController.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 22/10/2022.
//

import UIKit
import CoreData
import CoreLocation

class SaveInformationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var pickerCategorie: UIPickerView!
    @IBOutlet weak var titlePlace: UITextField!
    
    @IBOutlet weak var adressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        guard let postalAdressUnwraped = postalAdress else { return }

//        adressLabel.text = postalAdressUnwraped.subThoroughfare // numéro adresse
//        adressLabel.text = postalAdressUnwraped.postalCode // codePostal
//        adressLabel.text = postalAdressUnwraped.locality // ville
//        adressLabel.text = postalAdressUnwraped.thoroughfare // rue
//        adressLabel.text = postalAdressUnwraped.name // adress complete : numero + rue
//        adressLabel.text = postalAdressUnwraped.country // pays
//        adressLabel.text = postalAdressUnwraped.administrativeArea // departement
      
      
        
    }
    var categoriesPlace = ["Restaurant","Monument","Magasin","Parc","Autres"]
    var locationManager = CLLocationManager()
    
    var coordonnésGPS : CLLocation?
    var arrayPostal : CLPlacemark?
    
    @IBAction func takePhotoButton(_ sender: Any) {
       
        imagePicker()
    }

    @IBAction func saveButton(_ sender: Any) {
        
        
    }
    
    
    func imagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        if let image = info[UIImagePickerController.InfoKey.originalImage]as? UIImage {
            imagePlace.contentMode = .scaleAspectFit
            imagePlace.image = image
        }
    }
    
}

extension SaveInformationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        categoriesPlace.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesPlace[row]
    }
}
