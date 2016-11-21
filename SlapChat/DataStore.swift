//
//  DataStore.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class DataStore {
  static let sharedInstance = DataStore()
  var messages = [Message]()
  private init() {}
  
  // MARK: - Core Data stack
  lazy var persistentContainer: NSPersistentContainer = {
    /*
     The persistent container for the application. This implementation
     creates and returns a container, having loaded the store for the
     application to it. This property is optional since there are legitimate
     error conditions that could cause the creation of the store to fail.
     */
    let container = NSPersistentContainer(name: "slapChat")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        /*
         Typical reasons for an error here include:
         * The parent directory does not exist, cannot be created, or disallows writing.
         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
         * The device is out of space.
         * The store could not be migrated to the current model version.
         Check the error message to determine what the actual problem was.
         */
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  func fetchData() {
    
    // First create managed context object, the holds all the content currently working on. Like staging
    let context = self.persistentContainer.viewContext
    // Fetch Request
    let fetchRequest = NSFetchRequest<Message>(entityName: "Message")
    do {
      // fill an array with the fetched managedConttext
      self.messages = try context.fetch(fetchRequest)
    } catch {
      print("failed while...")
    }
    
    try! context.save()
  }
  
    func generateTestData() {
        let context = persistentContainer.viewContext
        let testMessage = Message(context: context)
        
        testMessage.setValue("Cover your mouth", forKey: "content")
        testMessage.setValue(NSDate(), forKey: "createdAt")
        
        do {
            try context.save()
        } catch {
            print("failed saving context")
        }
        
        //store.messages.append(testMessage)
        
        saveContext()
        fetchData()
    }

  // MARK: - Core Data Saving support
  func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
}
