//
//  CoreDataManager.swift
//  Weather
//
//  Created by esens on 24/02/2023.
//

import CoreData
let persistentContainerName: String = "ToDoListModel"

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    let fetch: NSFetchedResultsController<Task>
    private let viewContext: NSManagedObjectContext
    
    private init() {
        persistentContainer = NSPersistentContainer(name: persistentContainerName)
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("unable to init core data\(error)")
            }
        }
        viewContext =  persistentContainer.viewContext
        fetch = NSFetchedResultsController(fetchRequest: Task.getAllItems(),
                                           managedObjectContext: viewContext,
                                           sectionNameKeyPath: nil,
                                           cacheName: nil)
    }
    
    func performFetch(_ completion: @escaping ([Task]) -> Void) {
        do { try fetch.performFetch()
            guard let tasks = fetch.fetchedObjects else { return }
            completion(tasks)
        } catch {
            print(error)
        }
    }
    
    func deleteTask(taskId: NSManagedObjectID) {
        do {
            guard let task = try viewContext.existingObject(with: taskId)  as? Task else { return }
            try task.delete()
        } catch {
            print(error)
        }
    }
    
    func addTask(title: String, lat: Double, lon: Double) {
        do {
            let task = Task(context: viewContext)
            task.name = title
            task.lat = lat
            task.lon = lon
             try task.save()
        } catch {
            print("error")
        }
    }
    
}
