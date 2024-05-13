//
//  QuizEndView.swift
//  QuizApp
//
//  Created by Keegen Wallis on 13/5/2024.
//

import SwiftUI

struct QuizEndView: View {
    @State public var score: Int = 0
    @State public var totalQuestions: Int = 0
    @State public var user: String = ""
    @State public var category: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Results")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Text("Your score was: \(score)/\(totalQuestions)")
                .font(.title)
            
            Spacer()
            
            NavigationLink(
                destination: QuizSettingsView(),
                label: {
                    Text("Play Again")
                }
            )
            .font(.system(size: 24))
            .bold()
            .frame(maxWidth: 250)
            .frame(height: 60)
            .background(.cyan)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding()
            
            NavigationLink(
                destination: LeaderboardView(),
                label: {
                    Text("View Leaderboard")
                }
            )
            .font(.system(size: 24))
            .bold()
            .frame(maxWidth: 250)
            .frame(height: 60)
            .background(.green)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    NavigationView {
        QuizEndView()
    }
}
