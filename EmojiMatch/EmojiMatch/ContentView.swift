//
//  ContentView.swift
//  EmojiMatch
//
//  Created by StudentAM on 3/14/24.
//

import SwiftUI

struct ContentView: View {
    // Time (Most likely not going to think about implementing a timer. Too much work)
    @State var showSeconds = true
    
    // This stuff is going to be a part of the game
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 12)
    
    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",].shuffled()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: -135, alignment: nil), count: 3)
    
    @State private var pickOne: Int = -1
    
    @State private var pickTwo: Int = -1
    
    @State private var score: Int = 0
    
    @State var totalScore: Int = 0
    
    @State var level: Int = 0
    
    @State private var health: Int = 10
    
    @State private var gameFinished: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack {
                    Image("contentBackground")
                VStack {
                    TimelineView(.periodic(from: Date(), by: 1)) { context in TimeTestView(date: context.date, showSeconds: showSeconds)
                    }
                    Text("Health: \(health)")
                        .padding(-11)
                        .foregroundColor(.white)
                    Text("Current Score: \(totalScore)")
                        .padding()
                        .bold(true)
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    LazyVGrid(columns: columns){
                            ForEach(emojis.indices, id: \.self) { index in
                                Button(action: {cardPicked(index: index)}, label: {
                                    UndercoverView(emoji: emojis[index], flipped: cardsFlipped[index])
                                })
                            }
                        }
                        if gameFinished {
                            HStack{
                                Button("Next Level", action:{
                                    reset()
                                })
                                .padding(20)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .bold(true)
                                .font(.system(size:20))
                                
                                NavigationLink(destination: FinishedView().navigationBarBackButtonHidden(true), label: {
                                    Text("End Game")
                                        .padding(20)
                                        .background(.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                        .bold(true)
                                        .font(.system(size:20))
                                    })
                            }
                        }
                    
                }
            }
        }
    }
    // Activates when the user clicks on a card
    func cardPicked (index: Int) {
        if cardsFlipped[index] {
            return
        }
        if !gameFinished {
            if pickOne == -1 || pickTwo == -1 {
                if pickOne == -1 {
                    pickOne = index
                    cardsFlipped[index] = true
                    print(pickOne)
                    print(pickTwo)
                } else {
                    pickTwo = index
                    cardsFlipped[index] = true
                    print(pickOne)
                    print(pickTwo)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if emojis[pickOne] == emojis[pickTwo] && pickOne != pickTwo {
                            totalScore += 1
                            score += 1
                            if score == emojis.count / 2 - 1 {
                                finishLevel()
                            }
                            
                            if totalScore % 2 == 0 {
                                health += 1
                                
                                if health > 10 && level < 6 {
                                    health = 10
                                } else if health > 11 && level < 11 {
                                    health = 11
                                } else if health > 12 && level < 16 {
                                    health = 12
                                }
                            }
                            pickOne = -1
                            pickTwo = -1
                        } else {
                            cardsFlipped[pickOne] = false
                            cardsFlipped[pickTwo] = false
                            health -= 1
                            pickOne = -1
                            pickTwo = -1
                        }
                        healthCheck()
                    }
                }
                // To split the console logs that prints both pickOne and pickTwo whenever the player presses on a card
                print("-----")
            }
        }
    }
    
    func healthCheck () {
        if health == 0 {
            gameFinished = true
        }
    }
    
    func finishLevel () {
        gameFinished = true
    }
    
    func reset () {
        for i in emojis.indices {
            cardsFlipped[i] = false
        }
        if health == 0 {
            totalScore -= score
            if level < 6 {
                health = 10
            } else if level > 5 && level < 11 {
                health = 11
            } else if level > 10 && level < 16 {
                health = 12
            }
        } else {
            level += 1
            health += 2
            if health > 10 && level < 6 {
                health = 10
            } else if health > 11 && level > 5 &&  level < 11 {
                health = 11
            } else if health > 12 && level > 10 && level < 16 {
                health = 12
            }
        }
        score = 0
        emojis.shuffle()
        gameFinished = false
    }
}

#Preview {
    ContentView()
}
