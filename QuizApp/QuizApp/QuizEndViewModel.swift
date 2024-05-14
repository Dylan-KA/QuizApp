import Foundation
import Combine

class QuizEndViewModel: ObservableObject {
    @Published var score: Int?
    @Published var totalQuestions: Double?
    @Published var user: String?
    @Published var category: String?
    
    //@Published var quizEndViewModel: QuizEndViewModel
    @Published var leaderboardViewModel = LeaderboardViewModel()
    
    init(score: Int, totalQuestions :Double, user :String, category :String) {
        self.score = score
        self.totalQuestions = totalQuestions
        self.user = user
        self.category = category
        
        print(score)
        print(totalQuestions)
        print(user)
        print(category)
        
        leaderboardViewModel.AddData(name: user, category: category, score: score)
        leaderboardViewModel.saveLeadboard()
    }
    
}
