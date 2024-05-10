//
//  CategoriesViewModel.swift
//  QuizApp
//
//  Created by Dylan Archer on 10/5/2024.
//

import Foundation

class CategoriesViewModel : ObservableObject {
    @Published var difficulty: String
    @Published var amount: Double
    
    init(difficulty: String, amount: Double) {
        self.difficulty = difficulty
        self.amount = amount
    }
}
