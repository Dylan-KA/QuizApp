//
//  WelcomeView.swift
//  QuizApp
//
//  Created by Keegen Wallis on 7/5/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Divider()
                    .frame(width: 250, height: 4)
                    .background(Color.black)
                    .padding(.vertical, 20)
                
                Spacer()
                
                NavigationLink(
                    destination: QuizSettingsView(),
                    label: {
                        Text("Start a Quiz")
                    }
                )
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
                
                NavigationLink(
                    destination: LeaderboardView(),
                    label: {
                        Text("Leaderboards")
                    }
                )
                .padding()
                .background(Color(#colorLiteral(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
                Spacer()
            }
            .padding(70)
            .background(Color(#colorLiteral(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    WelcomeView()
}
