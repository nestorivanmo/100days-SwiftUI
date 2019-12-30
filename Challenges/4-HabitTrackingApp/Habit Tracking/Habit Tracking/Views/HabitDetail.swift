//
//  HabitDetail.swift
//  Habit Tracking
//
//  Created by Néstor I. Martínez Ostoa on 29/12/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct HabitDetail: View {
    @ObservedObject var habits: Habits
    @State var habit: Habit
    
    var body: some View {
        VStack(spacing: 70) {
            VStack {
                Text("Description")
                    .font(.headline)
                Text(habit.description)
            }
            VStack {
                Text("Times completed")
                    .font(.headline)
                Text("\(habit.timesCompleted)")
            }
            Button("Increment times") {
                var i = 0
                var id = 0
                for h in self.habits.items {
                    if h.id == self.habit.id {
                        id = i
                    }
                    i += 1
                }
                self.habits.items.remove(at: id)
                self.habit.timesCompleted += 1
                self.habits.items.append(self.habit)
            }
        }
        .navigationBarTitle(habit.name)
    }
}

struct HabitDetail_Previews: PreviewProvider {
    static let habits = Habits()
    static let habit = Habit(name: "", description: "", timesCompleted: 0)
    static var previews: some View {
        HabitDetail(habits: habits, habit: habit)
    }
}
