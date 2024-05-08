//
//  LeaderboardView.swift
//  QuizApp
//
//  Created by Keegen Wallis on 7/5/2024.
//

import SwiftUI

struct LeaderboardView: View {
    @StateObject var leaderboardViewModel = LeaderboardViewModel()
    @State private var selectedCategory: String? = nil
    @State private var selectedOption = "All"
    @State private var options: [String] = []
    
    var body: some View {
        VStack{
            Spacer()
            Text("Leaderboard")
                .font(.largeTitle)

            Picker(selection: $selectedOption, label: Text("Select Category")) {
                ForEach(leaderboardViewModel.getCategories(), id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            
            List(leaderboardViewModel.filteredQuizResults(selectedOption: selectedOption)) { QuizResult in
                    Text("\(QuizResult.name): \(QuizResult.score)")
            }
            
            Spacer()
        }
    }
}
#Preview {
    LeaderboardView()
}
