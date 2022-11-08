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
        
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let coredataStack = appdelegate.coreDataStack
        coreDataManager = CoreDataManager(coreDataStack: coredataStack)
        unwrapAdressInfo()
        adressLabel.text = adresse
       
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
         latitudePoint = locations?.coordinate.latitude ?? 0.0
         longitudePoint = locations?.coordinate.longitude ?? 0.0
        
    }
    
    var coreDataManager: CoreDataManager?
    var categoriesPlace = ["Restaurant","Monument","Magasin","Parc","Autres"]
    var categorieSelected = "Restaurant"
    var adresse = String()
    var arrayPostal : CLPlacemark? // receive Postal adress from MapViewController
    var locations : CLLocation? // receive coordonnées from MapViewController
    var imageConverted = Data()
    var latitudePoint : Double?
    var longitudePoint: Double?

    
    @IBAction func takePhotoButton(_ sender: Any) {
        imagePicker()
    }

    @IBAction func saveButton(_ sender: Any) {
        
        coreDataManager?.createPlace(adresse: adresse, categorie: categorieSelected, title: titlePlace.text ?? "", image: imageConverted, latitudes: latitudePoint ?? 0.0, longitudes: longitudePoint ?? 0.0)
   
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
            guard let imageData = image.pngData() else { return }
            imageConverted = imageData
        }
    }
    
    func unwrapAdressInfo() {
        guard let postalAdressName = arrayPostal?.name else { return }
        guard let postalAdressCountry = arrayPostal?.country else { return }
        guard let postalAdressCity = arrayPostal?.locality else { return }
        guard let postalAdressPostalCode = arrayPostal?.postalCode else { return }
        adresse = postalAdressName + " " + postalAdressCity + " " + postalAdressPostalCode + " " + postalAdressCountry
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        categorieSelected = categoriesPlace[row]
      
    }
}
