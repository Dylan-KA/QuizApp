//
//  QuestionView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 14/5/2024.
//


import SwiftUI

struct QuestionView: View {
    
    @StateObject var viewModel :QuestionViewModel
    @ObservedObject var quizEndViewModel = QuizEndViewModel()
    
    init(quiz: Quiz) {
        _viewModel = StateObject(wrappedValue: QuestionViewModel(quiz: quiz))
    }
    
    var body: some View {
        if viewModel.quizComplete {
            // Show the destination view when quiz is complete
            NavigationLink(
                destination: QuizEndView(viewModel: QuizEndViewModel()),
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
            .simultaneousGesture(
                TapGesture()
                .onEnded {
                    quizEndViewModel.score = viewModel.numOfCorrect
                    print(quizEndViewModel)
                }
            )
        } else {
            VStack {
                Text("Question \(viewModel.questionNumber) of \(viewModel.quiz.results.count)")
                    .font(.system(size: 40))
                    .bold()
                    .padding(30)
                Spacer()
                Text("\(viewModel.currentQuestion ?? "")")
                    .font(.system(size: 40))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                Spacer()
                if let answerFeedback = viewModel.answerFeedback {
                    Text(answerFeedback)
                        .foregroundColor(viewModel.isAnswerCorrect ? .green : .red)
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                }
                VStack {
                    Button(action: { viewModel.selectOption(option: viewModel.shuffledOptions[0]) }) {
                        Text("\(viewModel.shuffledOptions[0])")
                            .font(.system(size: 20))
                            .frame(maxWidth: 500)
                            .frame(height: 55)
                            .background(.cyan)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .padding()
                    }
                    Button(action: { viewModel.selectOption(option: viewModel.shuffledOptions[1]) }) {
                        Text("\(viewModel.shuffledOptions[1])")
                            .font(.system(size: 20))
                            .frame(maxWidth: 500)
                            .frame(height: 55)
                            .background(.cyan)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .padding()
                    }
                    Button(action: { viewModel.selectOption(option: viewModel.shuffledOptions[2]) }) {
                        Text("\(viewModel.shuffledOptions[2])")
                            .font(.system(size: 20))
                            .frame(maxWidth: 500)
                            .frame(height: 55)
                            .background(.cyan)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .padding()
                    }
                    Button(action: { viewModel.selectOption(option: viewModel.shuffledOptions[3]) }) {
                        Text("\(viewModel.shuffledOptions[3])")
                            .font(.system(size: 20))
                            .frame(maxWidth: 500)
                            .frame(height: 55)
                            .background(.cyan)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .padding()
                    }
                }
                if (viewModel.quizComplete) {
                    NavigationLink(destination: EntryView()) {
                    }
                }
                Spacer()
            }
            .onAppear(perform: viewModel.getNextQuestion)
        }
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

