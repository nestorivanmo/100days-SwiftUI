//
//  ContentView.swift
//  RPS_Training
//
//  Created by Néstor I. Martínez Ostoa on 25/10/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let possibleChoices = ["Rock", "Paper", "Scissors"]
    @State private var round = 1
    @State private var userScore = 0
    @State private var computerChoiceR = Int.random(in: 0...2)
    @State private var playerShouldW = Bool.random()
    @State private var endGame = false
    
    func gameState(userChoice: Int, computerChoice: Int, playerShouldWin: Bool) {
        if playerShouldWin {
            if (computerChoice == 2 && userChoice == 0) || (userChoice > computerChoice){
                userScore += 1
            } else {
                if userScore > 0 {
                    userScore -= 1
                }
            }
        } else {
            if (computerChoice == 0 && userChoice == 2) || (userChoice < computerChoice){
                userScore += 1
            } else {
                if userScore > 0 {
                    userScore -= 1
                }
            }
        }
        computerChoiceR = Int.random(in: 0...2)
        playerShouldW = Bool.random()
    }
    
    func determineExit(userChoice: Int ) {
        if round < 10 {
            gameState(userChoice: userChoice, computerChoice: computerChoiceR, playerShouldWin: playerShouldW)
            round += 1
        } else {
            round = 1
            endGame = true
        }
    }
    
    var buttons: some View {
        HStack {
            Button(action: {
                self.determineExit(userChoice: 0)
            }) {
                Text("Rock")
            }.alert(isPresented: $endGame, content: {
                Alert(title: Text("Game over"), message: Text("Your score is \(self.userScore)"), dismissButton: .default(Text("OK")))
            })
            Button(action: {
                self.determineExit(userChoice: 1)
            }) {
                Text("Paper")
            }
            .alert(isPresented: $endGame, content: {
                Alert(title: Text("Game over"), message: Text("Your score is \(self.userScore)"), dismissButton: .default(Text("OK")))
            })
            Button(action: {
                self.determineExit(userChoice: 2)
            }) {
                Text("Scissors")
            }.alert(isPresented: $endGame, content: {
                Alert(title: Text("Game over"), message: Text("Your score is \(self.userScore)"), dismissButton: .default(Text("OK")))
            })
        }
    }
    
    var body: some View {
        VStack {
            Text("Score: \(userScore)")
            Text("Round \(round) / 10")
            Text("What option should you chose? if...")
            Text("The computer chose: \(possibleChoices[computerChoiceR])")
            Text("And you should: \(playerShouldW ? "Win":"Lose")")
            buttons
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
