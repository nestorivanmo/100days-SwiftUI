//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Néstor I. Martínez Ostoa on 08/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content){
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
