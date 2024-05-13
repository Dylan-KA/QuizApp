//
//  LeaderboardViewModel.swift
//  QuizApp
//
//  Created by Keegen Wallis on 7/5/2024.
//

import Foundation
class LeaderboardViewModel: ObservableObject {
    var quizScores: [QuizResult] = []
    @Published var categories: [String] = []
    
    /*init(){
        let testScore = QuizResult(name: "Keegen", category: "General Knowledge", score: 7)
        let testScore4 = QuizResult(name: "Keegen", category: "Books", score: 8)
        let testScore8 = QuizResult(name: "Keegen", category: "Books", score: 5)
        let testScore1 = QuizResult(name: "Adnan", category: "Books", score: 8)
        let testScore5 = QuizResult(name: "Adnan", category: "Film", score: 9)
        let testScore2 = QuizResult(name: "Shak", category: "Film", score: 9)
        let testScore6 = QuizResult(name: "Shak", category: "Music", score: 10)
        let testScore3 = QuizResult(name: "Dylan", category: "Music", score: 8)
        let testScore7 = QuizResult(name: "Dylan", category: "General Knowledge", score: 9)
        
        self.quizScores.append(contentsOf: [testScore, testScore1, testScore2, testScore3, testScore4, testScore5, testScore6, testScore7, testScore8])
        UpdateQuizScores()
    }*/
    
    func AddData(name: String, category: String, score: Int) {
        let newQuizResult = QuizResult(name: name, category: category, score: score)
        quizScores.append(newQuizResult)
        UpdateQuizScores()
    }
    
    func getCategories() -> [String] {
        var categories = [String]()
        categories.append("All")
        
        for quiz in quizScores {
            if !categories.contains(quiz.category) {
                categories.append(quiz.category)
            }
        }
        
        return categories
    }
    
    func UpdateQuizScores() {
        var updatedScores: [QuizResult] = []
        var indexToRemove: [Int] = []

        for (index, score) in quizScores.enumerated() {
            if let existingIndex = updatedScores.firstIndex(where: { $0.name == score.name && $0.category == score.category }) {
                updatedScores[existingIndex].score += score.score
                indexToRemove.append(index)
            } else {
                updatedScores.append(score)
            }
        }

        for index in indexToRemove.sorted(by: >) {
            quizScores.remove(at: index)
        }

        quizScores = updatedScores
    }
    
    func filteredQuizResults(selectedOption: String) -> [QuizResult] {
        var categoryScores = [QuizResult]()
        var allScores = [QuizResult]()
        
        for quiz in quizScores {
            if selectedOption == "All" {
                allScores.append(quiz)
            } else {
                if quiz.category == selectedOption {
                    categoryScores.append(quiz)
                }
            }
        }
        
        if selectedOption == "All" {
            return addAllScores(scores: &allScores)
        } else {
            return orderQuizScores(scores: &categoryScores)
        }
    }
    
    func addAllScores(scores: inout [QuizResult]) -> [QuizResult]{
        var combinedQuizScores: [QuizResult] = []
        
        for score in scores {
            if let existingPlayerScore = combinedQuizScores.firstIndex(where: {$0.name == score.name}) {
                combinedQuizScores[existingPlayerScore].score += score.score
            } else {
                combinedQuizScores.append(score)
            }
        }
        return orderQuizScores(scores: &combinedQuizScores)
    }
    
    func orderQuizScores(scores: inout [QuizResult]) -> [QuizResult]{
        scores.sort{$0.score > $1.score}
        return scores
    }
    
    struct QuizResult: Identifiable {
        var id = UUID()
        var name: String
        var category: String
        var score: Int
    }
}
