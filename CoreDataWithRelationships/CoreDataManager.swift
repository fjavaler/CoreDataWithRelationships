//
//  CoreDataManager.swift
//  CoreDataWithRelationships
//
//  Created by Fred Javalera on 6/3/21.
//

import CoreData

class CoreDataManager {
  
  // MARK: Properties
  static let instance = CoreDataManager()
  let container: NSPersistentContainer
  let context: NSManagedObjectContext
  
  // MARK: Init
  init() {
    container = NSPersistentContainer(name: "CoreDataContainer")
    container.loadPersistentStores { description, error in
      if let error = error {
        print("Error loading Core Data. \(error)")
      }
    }
    context = container.viewContext
  }
  
  // MARK: Methods
  func save() {
    do {
      try context.save()
      print("Saved successfully!")
    } catch let error {
      print("Error saving Core Data. \(error.localizedDescription)")
    }
  }
}
