//
//  QuizSettingsViewModel.swift
//  QuizApp
//
//  Created by Dylan Archer on 30/4/2024.
//

import Foundation

class QuizSettingsViewModel : ObservableObject {
    @Published var category: String
    @Published var difficulty: String
    @Published var amount: Double
    
    init() {
        //Default values
        self.category = "General Knowledge"
        self.difficulty = "easy"
        self.amount = 10
    }
    
}
