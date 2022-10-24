//
//  SaveInformationViewController.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 22/10/2022.
//

import UIKit

class SaveInformationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var pickerCategorie: UIPickerView!
    @IBOutlet weak var titlePlace: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var categoriesPlace = ["Restaurant","Monument","Magasin","Parc","Autres"]

    @IBAction func takePhotoButton(_ sender: Any) {
    
        imagePicker()
    }

    @IBAction func saveButton(_ sender: Any) {
        
    }
    
    func imagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
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
