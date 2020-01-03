//
//  ContentView.swift
//  Bookworm
//
//  Created by Néstor I. Martínez Ostoa on 02/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool

    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors:offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0:5)
    }
}

struct ContentView: View {
    @State private var rememeberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember me", isOn: $rememeberMe)
            Text(rememeberMe ? "On":"Off")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
