//
//  ContentView.swift
//  QuizApp
//
//  Created by Dylan Archer on 30/4/2024.
//

import SwiftUI

struct QuizSettingsView: View {
    @State private var quiz: Quiz? //List of questions, populated after clicking begin
    @StateObject var viewModel = QuizSettingsViewModel()
    
    let difficulties = ["easy", "medium", "hard"] //API requies lower-case, need to fix for view
    let categoryMap: [String: Int] = {
        let categories = [
            "General Knowledge","Books","Film","Music","Theatre","TV","Videogames","Board Games","Science & Nature","Computers","Mathematics","Mythology","Sports","Geography","History","Politics","Art","Celebrities","Animals","Vehicles","Comics","Gadgets","Anime","Cartoons"]
        var map = [String: Int]()
        for (index, category) in categories.enumerated() {
            map[category] = 9 + index
        }
        return map
    }()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Not Finished! Testing API")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Prints first question to console")
                .font(.title3)
            Spacer()
            
            HStack {
                Text("Difficulty")
                Picker("Difficulty", selection: $viewModel.difficulty) {
                    ForEach(difficulties, id: \.self) {
                        Text($0)
                    }
                }
                    .pickerStyle(.menu)
            }
            HStack {
                Text("Category")
                Picker("Category", selection: $viewModel.category) {
                    ForEach(categoryMap.keys.sorted(), id: \.self) {
                        Text($0)
                    }
                }
                    .pickerStyle(.menu)
            }
            Text("Questions: \(Int(viewModel.amount))")
            Slider(value: $viewModel.amount, in: 5...20, step: 1.0)
                .padding()
                .frame(maxWidth: 325)
            Button("Begin") {
                fetchQuiz()
            }
            Spacer()
        }
        .padding()
    }
    
    func fetchQuiz() {
        Task {
            do {
                let api = QuizAPI()
                let selectedCategory = viewModel.category
                let categoryId = categoryMap[selectedCategory] ?? 9
                quiz = try await api.fetchQuizAPI(Amount: Int(viewModel.amount), Category: categoryId, Difficulty: "\(viewModel.difficulty)")
                print("Printing the first question in the list")
                if let question = quiz?.results.first {
                    print("Question: \(question.question)")
                    print("Correct Answer: \(question.correct_answer)")
                    print("Incorrect Answers:")
                    for answer in question.incorrect_answers {
                        print("- \(answer)")
                    }
                } else {
                    print("No questions fetched.")
                }
            } catch {
                print("Error fetching quiz: \(error)")
            }
        }
    }
}


#Preview {
    QuizSettingsView()
}
