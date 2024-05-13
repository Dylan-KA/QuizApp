//
//  QuestionViewModel.swift
//  QuizApp
//
//  Created by Dylan Archer on 13/5/2024.
//

import Foundation

class QuestionViewModel : ObservableObject {
    
    @Published var quiz: Quiz
    @Published var questionNumber :Int = 0
    @Published var currentQuestion: String?
    @Published var currentAnswer: String?
    @Published var currentWrongOptions: [String]?
    @Published var shuffledOptions: [String] = ["", "", "", ""]
    @Published var numOfCorrect = 0
    
    init(quiz: Quiz) {
        self.quiz = quiz
    }
    
    func shuffleQuestions() {
        shuffledOptions[0] = currentAnswer!
        shuffledOptions[1] = currentWrongOptions![0]
        shuffledOptions[2] = currentWrongOptions![1]
        shuffledOptions[3] = currentWrongOptions![2]
        shuffledOptions.shuffle()
    }
    
    func getNextQuestion() {
        currentQuestion = quiz.results[questionNumber].question
        currentAnswer = quiz.results[questionNumber].correct_answer
        currentWrongOptions = quiz.results[questionNumber].incorrect_answers
        shuffleQuestions()
        questionNumber += 1
    }
    
    func selectOption(option :String) {
        if (currentAnswer == option) {
            numOfCorrect += 1
        }
    }
    
    func doSomething() {
        
    }
    
}
