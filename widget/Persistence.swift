//
//  Persistence.swift
//  widget
//
//  Created by 古賀遥貴 on 2022/11/06.
//

import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()
    
    private let persistentContainer: NSPersistentContainer = {
        // widget用
        let storeURL = FileManager.appGroupContainerURL.appendingPathComponent("Item")
        // NSPersistentContainerの設定
        let container = NSPersistentContainer(name: "widget")
        container.persistentStoreDescriptions = [NSPersistentStoreDescription(url: storeURL)]
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error as NSError? {
                // 任意のエラー処理を実装する
            }
        })
        return container
    }()
}

extension PersistenceController {
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var workingContext: NSManagedObjectContext {
        
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.parent = managedObjectContext
        
        return context
    }
}

extension FileManager {
    static let appGroupContainerURL = FileManager.default
        .containerURL(forSecurityApplicationGroupIdentifier: "group.practice.widget")!
}
