//
//  Task.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation
import CoreData

extension Task: BaseModel  {
    
    class func newInstance(name: String, lat: Double, lon: Double,
                           context: NSManagedObjectContext) -> Task {
        let task = NSEntityDescription.insertNewObject(forEntityName: "Task",
                                                       into: context) as! Task
        task.name = name
        task.lat = lat
        task.lon = lon
         return task
    }
    
    static func getAllItems() -> NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        let sort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sort]
        return request
    }
}



