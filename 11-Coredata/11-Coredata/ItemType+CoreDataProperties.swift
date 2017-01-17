//
//  ItemType+CoreDataProperties.swift
//  11-Coredata
//
//  Created by Alex Comunian on 17/01/17.
//  Copyright © 2017 Alex Comunian. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
