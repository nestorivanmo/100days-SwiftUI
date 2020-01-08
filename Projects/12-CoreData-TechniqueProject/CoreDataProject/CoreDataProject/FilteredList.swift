//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Néstor I. Martínez Ostoa on 08/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//
import CoreData
import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> {
        fetchRequest.wrappedValue
    }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName )")
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
