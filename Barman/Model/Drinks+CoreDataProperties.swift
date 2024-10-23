//
//  Drinks+CoreDataProperties.swift
//  Barman
//
//  Created by DISMOV on 23/10/24.
//
//

import Foundation
import CoreData


extension Drinks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drinks> {
        return NSFetchRequest<Drinks>(entityName: "Drinks")
    }

    @NSManaged public var name: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var directions: String?
    @NSManaged public var img: String?

}

extension Drinks : Identifiable {

}


