//
//  WelcomeView.swift
//  QuizApp
//
//  Created by Keegen Wallis on 7/5/2024.
//

import SwiftUI

struct WelcomeView: View {
    var name :String = "name goes here"
    
    var body: some View {
        VStack {
            Spacer()

            Text("Welcome")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("\(name)")
                .font(.system(size: 20))
                .padding()

            Spacer()

            NavigationLink(destination: QuizSettingsView()) {
                Text("Start a Quiz")
            }
            .font(.system(size: 24))
            .bold()
            .frame(maxWidth: 250)
            .frame(height: 60)
            .background(.cyan)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding()

            NavigationLink(destination: LeaderboardView()) {
                Text("Leaderboards")
            }
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
