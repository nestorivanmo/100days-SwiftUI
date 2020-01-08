//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Néstor I. Martínez Ostoa on 07/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
