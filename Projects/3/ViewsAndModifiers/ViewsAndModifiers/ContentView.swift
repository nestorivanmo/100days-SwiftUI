//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Néstor I. Martínez Ostoa on 23/10/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func prominentTitle() -> some View {
        self.modifier(ProminentTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Some title")
        .prominentTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
