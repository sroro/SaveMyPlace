//
//  CoreDataManager.swift
//  SaveMyPlace
//
//  Created by Rodolphe Schnetzer on 28/10/2022.
//
import CoreData
import UIKit

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
    
    func createPlace(adresse:String, categorie:String, title:String, image: Data, latitudes: Double, longitudes: Double ) {
         let place = Place(context: managedObjectContext)
        
        place.adresse = adresse
        place.categorie = categorie
        place.title = title
        place.image = image
        place.latitudes = latitudes
        place.longitudes = longitudes
        coreDataStack.saveContext()
    }
    
    func deleteRecipe(title:String) {
        let request: NSFetchRequest<Place> = Place.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", title)
        guard let places = try? managedObjectContext.fetch(request) else { return }
        guard let place = places.first else { return }
        managedObjectContext.delete(place)
        coreDataStack.saveContext()
        
    }
    
    func deleteAllMedia() {
        places.forEach { managedObjectContext.delete($0)}
        coreDataStack.saveContext()
        }
}


