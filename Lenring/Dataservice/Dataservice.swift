//
//  Dataservice.swift
//  Lenring
//
//  Created by Huy on 5/17/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import Foundation
import CoreData
class Dataservice{
    static let shared: Dataservice = Dataservice()
    var isAvtive: Bool?
    
    private var _fetchedResultsController: NSFetchedResultsController<Entity>? = nil
    var fetchedResultsController: NSFetchedResultsController<Entity> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        let fetRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        let sort = NSSortDescriptor(key: "tu", ascending: true)
        fetRequest.sortDescriptors = [sort]
        
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetRequest, managedObjectContext: AppDelegate.context(), sectionNameKeyPath: nil, cacheName: "cache")
        //        _fetchedResultsController?.delegate = self
        try? _fetchedResultsController?.performFetch()
        return _fetchedResultsController!
    }
    
}
