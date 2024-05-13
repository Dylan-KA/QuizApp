//
//  WelcomeView.swift
//  QuizApp
//
//  Created by Keegen Wallis on 7/5/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()

            Text("Welcome")
                .font(.largeTitle)
                .fontWeight(.bold)

            Divider()
                .frame(width: 250, height: 4)
                .background(Color.black)
                .padding(.vertical, 20)

            Spacer()

            NavigationLink(destination: QuizSettingsView()) {
                Text("Start a Quiz")
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()

            NavigationLink(destination: LeaderboardView()) {
                Text("Leaderboards")
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()
                
            Spacer()
        }
        .padding(70)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    NavigationView {
        WelcomeView()
    }
}
