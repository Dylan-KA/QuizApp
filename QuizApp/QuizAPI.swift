//
//  QuizAPI.swift
//  QuizApp
//
//  Created by Dylan Archer on 30/4/2024.
//

import Foundation

struct Quiz :Decodable {
    let results :[Question]
}

struct Question :Decodable {
    let type :String
    let difficulty :String
    let category :String
    let question :String
    let correct_answer :String
    let incorrect_answers :[String]
}

class QuizAPI {
    
    func fetchQuizAPI(Amount: Int, Category: Int, Difficulty: String) async throws -> Quiz {
        let url = URL(string: "https://opentdb.com/api.php?amount=\(Amount)&category=\(Category)&difficulty=\(Difficulty)&type=multiple")!
        print("URL: \(url)")
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(Quiz.self, from: data)
        return decoded
    }
        
}
