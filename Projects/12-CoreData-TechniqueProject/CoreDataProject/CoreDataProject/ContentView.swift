//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Néstor I. Martínez Ostoa on 07/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//
import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH %@", "E")) var ships: FetchedResults<Ship>
    
//    NSPredicate(format: "universe == %@", "Star Wars"))
//    NSPredicate(format: "name < %@", "F"))
//    NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
//    NSPredicate(format: "name BEGINSWITH %@", "E"))
//    NSPredicate(format: "name BEGINSWITH[c] %@", "e"))
//    NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e"))

    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            Button("Add Examples") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"

                let ship2 = Ship(context: self.moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"

                let ship3 = Ship(context: self.moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"

                let ship4 = Ship(context: self.moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"

                try? self.moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
