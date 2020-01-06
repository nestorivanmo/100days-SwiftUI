//
//  DetailView.swift
//  Bookworm
//
//  Created by Néstor I. Martínez Ostoa on 04/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//

import CoreData
import SwiftUI

struct DetailView: View {
    let book: Book
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(self.book.review ?? "No review")
                    .padding()
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                Text(self.showDate(from: self.book.date))
                    .font(.title)
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown book"), displayMode: .inline)
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("Delete book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
                    self.deleteBook()
                }, secondaryButton: .cancel()
            )
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }){
            Image(systemName: "trash")
        })
    }
    
    func deleteBook() {
        moc.delete(book)
        presentationMode.wrappedValue.dismiss()
    }
    
    func showDate(from date: Date?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        guard let date = date else {return ""}
        return formatter.string(from: date)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test title"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This is a great book; I really enjoyed reading it."
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
