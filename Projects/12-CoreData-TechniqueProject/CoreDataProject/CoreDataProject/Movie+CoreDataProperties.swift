//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Néstor I. Martínez Ostoa on 07/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        return title ?? "Unknown title"
    }

}
