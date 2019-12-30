//
//  AddHabitToTrack.swift
//  Habit Tracking
//
//  Created by Néstor I. Martínez Ostoa on 29/12/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct AddHabitToTrack: View {
    @ObservedObject var habits: Habits
    @State private var name = ""
    @State private var description = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add new habit")
            .navigationBarItems(trailing: Button("Save"){
                let habit = Habit(name: self.name, description: self.description, timesCompleted: 0)
                self.habits.items.append(habit)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddHabitToTrack_Previews: PreviewProvider {
    static let habits = Habits()
    static var previews: some View {
        AddHabitToTrack(habits: self.habits)
    }
}
