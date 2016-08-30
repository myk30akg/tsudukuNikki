//
//  Diary+CoreDataProperties.swift
//  tsudukuNikki
//
//  Created by 竹田美雪 on 8/30/16.
//  Copyright © 2016 竹田美雪. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Diary {

    @NSManaged var date: NSTimeInterval
    @NSManaged var detail: String?
    @NSManaged var feeling: String?

}
