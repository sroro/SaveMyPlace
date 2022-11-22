//
//  PlaceSavedViewController.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 22/10/2022.
//

import UIKit
import CoreData

class PlaceSavedViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let coredataStack = appdelegate.coreDataStack
        coreDataManager = CoreDataManager(coreDataStack: coredataStack)
        tableview.register(UINib(nibName: "PlaceTableViewCell", bundle: nibBundle), forCellReuseIdentifier: "cellPlace")
        // Do any additional setup after loading the view.
        guard let arrays = coreDataManager?.places else { return }
        array = arrays
    }
    
    var coreDataManager: CoreDataManager?
    var arrayPlaceSelected = [Place]()
    var array = [Place]()
    
    @IBAction func CancelButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func deleteAll(_ sender: Any) {
        
        coreDataManager?.deleteAllMedia()
        tableview.reloadData()
    }
    

}

extension PlaceSavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        coreDataManager?.places.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellPlace", for: indexPath) as? PlaceTableViewCell else { return UITableViewCell() }
        cell.placeSave = coreDataManager?.places[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        array.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        guard let string = coreDataManager?.places[indexPath.row].title else { return }
        coreDataManager?.deleteRecipe(title: string)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let array = coreDataManager?.places else {return }
        arrayPlaceSelected.removeAll()
        arrayPlaceSelected.append(array[indexPath.row])
        performSegue(withIdentifier: "segueToPlace", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPlace" {
            let vcDestination = segue.destination as? PlaceSelectedViewController
            vcDestination?.placeSelected = arrayPlaceSelected
        }
    }
    
    
}
