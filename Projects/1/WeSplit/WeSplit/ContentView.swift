//
//  ContentView.swift
//  WeSplit
//
//  Created by Néstor I. Martínez Ostoa on 16/10/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry","Hermionie","Ron"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0 ..< students.count) {
                Text(self.students[$0])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
