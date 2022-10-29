//
//  CoreDataManager.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 28/10/2022.
//
import CoreData

final class CoreDataManager {
    private let coreDataStack: CoreDataStack
    private let managedObjectContext: NSManagedObjectContext
    
    var places: [Place] {
        let request: NSFetchRequest<Place> = Place.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "categorie", ascending: true)]
        guard let place = try? managedObjectContext.fetch(request) else { return []}
        return place
    }
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
        self.managedObjectContext = coreDataStack.mainContext
    }
    
    func createPlace(adresse:String, categorie:String, title:String) {
         let place = Place(context: managedObjectContext)
        
        place.adresse = adresse
        place.categorie = categorie
        place.title = title
        
        coreDataStack.saveContext()
    }
    
    func deleteAllMedia() {
        places.forEach { managedObjectContext.delete($0)}
        coreDataStack.saveContext()
        }
}


