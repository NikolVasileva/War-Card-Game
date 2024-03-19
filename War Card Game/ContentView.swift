//
//  ContentView.swift
//  War Card Game
//
//  Created by Nikol Vasileva on 18.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpucard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    
    var body: some View {

        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 45.0) {
                Image("logo")
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpucard)
                    Spacer()
                }
                
                Button(action: {
                    deal()
                }, label: {
                    Image("button")
                })

                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.bottom, 10.0)
                        
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.bottom, 10.0)
                        
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
            }

        }
        
        
    }
    
    func deal() {
        // Randomize the players card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        // Randomize the cpus card
        let cpuCardValue = Int.random(in: 2...14)
        cpucard = "card" + String(cpuCardValue)
        
        // Update the scores
        if playerCardValue > cpuCardValue {
            // Add 1 to player score
            playerScore += 1
        }
        else if cpuCardValue > playerCardValue {
            // Add 1 to cpu score
            cpuScore += 1
        }
    }
}

#Preview {
    ContentView()
}
