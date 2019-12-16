//
//  ContentView.swift
//  Moonshot
//
//  Created by Néstor I. Martínez Ostoa on 15/12/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<10) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
