//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Néstor I. Martínez Ostoa on 20/10/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct FlagImage : View {
    
    let flagImageName: String
    
    var body: some View {
        Image(self.flagImageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
    
    init(_ name: String) {
        self.flagImageName = name
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia","France","Germany","Poland","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    
    var body: some View {
        ZStack {
        LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .lineLimit(nil)
                }
                ForEach(0..<3) { number in
                    Button(action:{
                        //Flag was tapped
                        self.flagTapped(number)
                        self.askQuestion()
                    }) {
                        FlagImage(self.countries[number])
                    }
                }
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue"), action: {
                self.askQuestion()
            }))
        })
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 10
            showingScore = false
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            var score = userScore
            score -= 10
            if score < 0 {
                userScore = 0
            }else {
                userScore -= 10
            }
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
