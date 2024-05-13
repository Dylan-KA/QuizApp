//
//  ContentView.swift
//  QuizApp
//
//  Created by Dylan Archer on 30/4/2024.
//

import SwiftUI

struct QuizSettingsView: View {
    @StateObject var viewModel = QuizSettingsViewModel()
    
    let difficulties = ["easy", "medium", "hard"]
    
    var body: some View {
        VStack {
            Spacer()
            Text("Quiz Settings")
                .font(.system(size: 40))
                .bold()
            Spacer()
            VStack {
                HStack {
                    Text("Difficulty")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .bold()
                    Spacer()
                }
                Picker("Difficulty", selection: $viewModel.difficulty) {
                    ForEach(difficulties, id: \.self) {
                        Text($0.capitalized)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
            )
            VStack {
                HStack {
                    Text("Questions: \(Int(viewModel.amount))")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .bold()
                    Spacer()
                }
                Slider(value: $viewModel.amount, in: 5...20, step: 1.0)
                    .frame(maxWidth: 325)
            }
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
            )
            Spacer()
            NavigationLink {
                CategoriesView(difficulty: viewModel.difficulty, amount: viewModel.amount)
            } label : {
                Text("Next")
                    .font(.system(size: 24))
                    .bold()
                    .frame(maxWidth: 200)
                    .frame(height: 55)
                    .background(.cyan)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding(.horizontal)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        QuizSettingsView()
    }
}
