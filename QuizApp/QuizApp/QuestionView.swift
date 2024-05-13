//
//  QuestionView.swift
//  QuizApp
//
//  Created by Dylan Archer on 10/5/2024.
//

import SwiftUI

struct QuestionView: View {
    
    @StateObject var viewModel :QuestionViewModel
    
    init(quiz: Quiz) {
        _viewModel = StateObject(wrappedValue: QuestionViewModel(quiz: quiz))
    }
    
    var body: some View {
        VStack {
            Text("Question \(viewModel.questionNumber) of \(viewModel.quiz.results.count)")
                .font(.system(size: 40))
                .bold()
                .padding(30)
            Spacer()
            Text("\(viewModel.currentQuestion ?? "")")
                .font(.system(size: 40))
                .padding()
            Spacer()
            VStack {
                Button(action: {
                    if let option = viewModel.shuffledOptions.first {
                        viewModel.selectOption(option: option)
                    }
                }) {
                    Text("Option 1: \(viewModel.shuffledOptions[0])")
                        .font(.system(size: 20))
                        .padding()
                }
                
                Button(action: viewModel.doSomething) {
                    Text("Option 2: \(viewModel.shuffledOptions[1])")
                        .font(.system(size: 20))
                        .padding()
                }
                Button(action: viewModel.doSomething) {
                    Text("Option 3: \(viewModel.shuffledOptions[2])")
                        .font(.system(size: 20))
                        .padding()
                }
                Button(action: viewModel.doSomething) {
                    Text("Option 4: \(viewModel.shuffledOptions[3])")
                        .font(.system(size: 20))
                        .padding()
                }
            }
            Spacer()
        }
        .onAppear(perform: viewModel.getNextQuestion)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        let question1 = Question(type: "multiple",
            difficulty: "medium",
            category: "General Knowledge",
            question: "What is the capital of France?",
            correct_answer: "Paris",
            incorrect_answers: ["Rome", "London", "Berlin"])
        
        let question2 = Question(type: "multiple",
            difficulty: "medium",
            category: "General Knowledge",
            question: "What is the largest mammal?",
            correct_answer: "Blue Whale",
            incorrect_answers: ["Elephant", "Giraffe", "Tiger"])
        
        let quizPlaceholder = Quiz(results: [question1, question2])
        
        let questionView = QuestionView(quiz: quizPlaceholder)
        
        return questionView
    }
}

