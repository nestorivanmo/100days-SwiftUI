//
//  ContentView.swift
//  Habit Tracking
//
//  Created by Néstor I. Martínez Ostoa on 29/12/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct Habit: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    var timesCompleted: Int
}

class Habits: ObservableObject {
    @Published var items = [Habit]()
}

struct ContentView: View {
    @State private var addNewHabit = false
    @ObservedObject var habits = Habits()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    NavigationLink(destination: HabitDetail(habits: self.habits, habit: item)) {
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("\(item.timesCompleted)")
                        }
                    }
                }
            .onDelete(perform: removeRows)
            }
            .navigationBarTitle("Streaks")
            .navigationBarItems(trailing: Button(action: {
                self.addNewHabit = true
            }){
                Image(systemName: "plus")
            })
            .sheet(isPresented: $addNewHabit) {
                AddHabitToTrack(habits: self.habits)
            }
        }
    }
    
    func removeRows(at offset: IndexSet) {
        habits.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
