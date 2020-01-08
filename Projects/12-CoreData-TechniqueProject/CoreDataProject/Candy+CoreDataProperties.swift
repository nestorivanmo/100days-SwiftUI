//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Néstor I. Martínez Ostoa on 08/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

}
