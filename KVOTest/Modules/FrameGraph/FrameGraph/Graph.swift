//
//  Graph.swift
//  FrameGraph
//
//  Created by Giles on 28/10/2019.
//  Copyright © 2019 Explore and Create Limited. All rights reserved.
//

import Foundation
import CoreData

// Migration only
// import FrameDataRealm

public class Graph
{
    // MARK: Singleton
    
    public static let shared = Graph()
    
    private init() {
        persistentContainer = PersistentContainer(name: "GraphStore")
        
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error {
                /*
                 Replace this implementation with code to handle the error appropriately.
                 
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                
                fatalError("Unresolved error \(error)")
            }
        }
            
        if allSubjects.count == 0 {
            
            let context = persistentContainer.viewContext
            
            for i in 0...100 {
                let entity = NSEntityDescription.entity(forEntityName: "Subject", in: context)
                let subject = NSManagedObject.init(entity: entity!, insertInto: context) as! Subject
                subject.setValue("Number_\(i)", forKeyPath: "pointID_")
                subject.setValue("Number_\(i)", forKeyPath: "title_")
            }
            
            try! context.save()
        }
    }

    // MARK: Core Data
    
    private var persistentContainer: PersistentContainer
    
    private var viewContext: NSManagedObjectContext { persistentContainer.viewContext }
    
    // MARK: Saarching
    
    public var allSubjects: [Subject]  {
        return try! persistentContainer.viewContext.fetch(Subject.fetchRequest())
    }
    
    public func subjects(forSearchTerm searchTerm: String) -> [Subject] {
        let request: NSFetchRequest<Subject> = Subject.fetchRequest()
        request.predicate = NSPredicate(format: "title_ CONTAINS[cd] %@", searchTerm)
        return try! viewContext.fetch(request)
    }
    
    public var randomSubjects: [Subject]
    {
        let num = Int.random(in: 0...3)
        switch num {
        case 0: return subjects(forSearchTerm: "1")
        case 1: return subjects(forSearchTerm: "2")
        case 2: return subjects(forSearchTerm: "3")
        case 3: return subjects(forSearchTerm: "4")
        default: return subjects(forSearchTerm: "5")
        }
    }
}
