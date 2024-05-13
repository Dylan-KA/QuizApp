import Foundation
import Combine

class QuizEndViewModel: ObservableObject {
    @Published var score: Int?
    @Published var totalQuestions: Double?
    @Published var user: String?
    @Published var category: String?
    
    init() {
        print(score ?? "no score set")
        print(totalQuestions ?? "no totalQuestions set")
        print(user ?? "no user set")
        print(category ?? "no category set")
        
        if let score = score, let user = user, let category = category {
            LeaderboardViewModel().AddData(name: user, category: category, score: score)
        }
    }
}
