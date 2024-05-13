//
//  QuizEndView.swift
//  QuizApp
//
//  Created by Keegen Wallis on 13/5/2024.
//

import SwiftUI

struct QuizEndView: View {
    @ObservedObject var viewModel: QuizEndViewModel
    @ObservedObject var leaderboardViewModel = LeaderboardViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Results")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Text("Your score was: \(viewModel.score ?? 0)/\(Int(viewModel.totalQuestions ?? 0))")
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
        QuizEndView(viewModel: QuizEndViewModel(score: 8, totalQuestions: 10, user: "user", category: "General Knowledge"))
    }
}
