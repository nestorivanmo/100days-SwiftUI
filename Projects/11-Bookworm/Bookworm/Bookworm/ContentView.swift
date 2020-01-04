//
//  ContentView.swift
//  Bookworm
//
//  Created by Néstor I. Martínez Ostoa on 02/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            Text("Count: \(books.count)")
                .navigationBarTitle("Bookworm")
                .navigationBarItems(trailing: Button(action: {
                    self.showingAddScreen.toggle()
                }, label: {
                    Image(systemName: "plus")
                }))
                .sheet(isPresented: $showingAddScreen) {
                    BookView().environment(\.managedObjectContext, self.moc)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
