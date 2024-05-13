//
//  TestQuizView.swift
//  QuizApp
//
//  Created by Dylan Archer on 10/5/2024.
//

import SwiftUI

struct QuizStartView: View {
    @State private var quiz: Quiz? //List of questions, populated after clicking begin
    private var amount :Int
    private var category: String
    private var difficulty: String
    
    init(amount: Int, category: String, difficulty: String) {
            self.amount = amount
            self.category = category
            self.difficulty = difficulty
        }
    
    var body: some View {
            VStack {
                Spacer()
                Text("\(category)")
                    .font(.system(size: 40))
                    .bold()
                    .padding(30)
                    .onAppear {
                        fetchQuiz()
                    }
                Spacer()
                Text("\(difficulty.capitalized) Difficulty")
                    .font(.system(size: 26))
                    .padding()
                Text("\(amount) Questions")
                    .font(.system(size: 26))
                    .padding()
                Spacer()
                NavigationLink {
                    QuestionView(quiz: quiz!)
                } label : {
                    Text("Start Quiz")
                        .font(.headline)
                        .frame(maxWidth: 200)
                        .frame(height: 55)
                        .background(.cyan)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .padding()
                }
                Spacer()
            }
    }
    
    let categoryMap: [String: Int] = {
        let categories = [
            "General Knowledge","Books","Film" ,"Music","Theatre","TV","Videogames","Board Games","Science & Nature","Computers","Mathematics","Mythology","Sports","Geography","History","Politics","Art","Celebrities","Animals","Vehicles","Comics","Gadgets","Anime","Cartoons"]
        var map = [String: Int]()
        for (index, category) in categories.enumerated() {
            map[category] = 9 + index
        }
        return map
    }()
    
    func fetchQuiz() {
        Task {
            do {
                let api = QuizAPI()
                guard let categoryInt = categoryMap[category] else {
                    print("Invalid category: \(category)")
                    return
                }
                quiz = try await api.fetchQuizAPI(Amount: amount, Category: categoryInt, Difficulty: difficulty)
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
    QuizStartView(amount: 5, category: "General Knowledge", difficulty: "easy")
}
