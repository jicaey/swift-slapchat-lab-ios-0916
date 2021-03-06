//
//  Message+CoreDataProperties.swift
//  SlapChat
//
//  Created by Michael Young on 11/9/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message");
    }

    @NSManaged public var content: String?
    @NSManaged public var createdAt: NSDate?

}
