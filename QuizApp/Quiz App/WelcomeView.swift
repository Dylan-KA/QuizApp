//
//  WelcomeView.swift
//  QuizApp
//
//  Created by Keegen Wallis on 7/5/2024.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("currentUsername") var currentUsername: String = ""

    var body: some View {
        VStack {
            Spacer()
            Text("Welcome,")
                .font(.system(size: 50, weight: .bold))
                .padding(.bottom, 1)
            Text(currentUsername)
                .font(.system(size: 40))
                .padding()
                .padding(.bottom, 20)
          

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
