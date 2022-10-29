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
    }
    
    var coreDataManager: CoreDataManager?
    
    
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
    
}
