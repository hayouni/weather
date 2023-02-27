//
//  CoreDataManager.swift
//  Weather
//
//  Created by esens on 24/02/2023.
//

import CoreData
let persistentContainerName: String = "CityListModel"

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
    
    func saveWeather(weather: String?,
                     icon: String?,
                     visibility: Double?,
                     sunset: Double?,
                     humidity: Double?,
                     task: Task?,
                     sunrise: Double?){
        do {
            let data = WeatherDetail(context: persistentContainer.viewContext)
            data.humidity = humidity ?? 0.0
            data.icon = icon.orEmpty
            data.sunrise = sunrise ?? 0.0
            data.sunset = sunset ?? 0.0
            data.visibility = visibility ?? 0.0
            data.weather = weather
            data.task = task
            try data.save()
        } catch {
            print("error")
        }
    }
    func performFetch(_ completion: @escaping ([Task]) -> Void) {
        do { try fetch.performFetch()
            guard let tasks = fetch.fetchedObjects else { return }
            completion(tasks)
        } catch {
            print(error)
        }
    }
    func addTask(title: String,
                 lat: String,
                 lon: String) {
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
