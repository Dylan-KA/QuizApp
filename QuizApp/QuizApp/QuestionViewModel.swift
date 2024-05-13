//
//  QuestionViewModel.swift
//  QuizApp
//
//  Created by Dylan Archer on 13/5/2024.
//

import Foundation

class QuestionViewModel : ObservableObject {
    @Published var quizEndViewModel :QuizEndViewModel?
    
    @Published var quiz: Quiz
    @Published var category :String
    @Published var questionNumber :Int = 0
    @Published var currentQuestion: String?
    @Published var currentAnswer: String?
    @Published var currentWrongOptions: [String]?
    @Published var shuffledOptions: [String] = ["", "", "", ""]
    @Published var numOfCorrect = 0
    @Published var quizComplete :Bool = false
    @Published var isAnswerCorrect :Bool = false
    @Published var answerFeedback :String?
    
    init(quiz: Quiz, category: String) {
        self.quiz = quiz
        self.category = category
    }
    
    func shuffleQuestions() {
        shuffledOptions[0] = decodeHTMLEntities(currentAnswer!) ?? ""
        shuffledOptions[1] = decodeHTMLEntities(currentWrongOptions![0]) ?? ""
        shuffledOptions[2] = decodeHTMLEntities(currentWrongOptions![1]) ?? ""
        shuffledOptions[3] = decodeHTMLEntities(currentWrongOptions![2]) ?? ""
        shuffledOptions.shuffle()
    }
    
    func getNextQuestion() {
        if (questionNumber < quiz.results.count) {
            currentQuestion = decodeHTMLEntities(quiz.results[questionNumber].question)
            currentAnswer = decodeHTMLEntities(quiz.results[questionNumber].correct_answer)
            currentWrongOptions = quiz.results[questionNumber].incorrect_answers
            shuffleQuestions()
            questionNumber += 1
        } else {
            quizComplete = true
            setQuizEndVariables()
            print("Out of questions")
        }
    }
    
    func selectOption(option :String) {
        if (currentAnswer == option) {
            numOfCorrect += 1
            isAnswerCorrect = true
            answerFeedback = "Correct!"
        } else {
            isAnswerCorrect = false
            answerFeedback = "Incorrect!"
        }
        getNextQuestion()
    }
    
    func decodeHTMLEntities(_ text: String) -> String? {
        guard let data = text.data(using: .utf8) else {
            return nil
        }
        do {
            let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            return attributedString.string
        } catch {
            print("Error decoding HTML entities:", error)
            return nil
        }
    }
    
    func setQuizEndVariables() {
        quizEndViewModel = QuizEndViewModel(score: numOfCorrect, totalQuestions: Double(quiz.results.count), user: "user", category: category)
    }
    
}
