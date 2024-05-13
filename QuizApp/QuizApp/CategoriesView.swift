//
//  CategoriesView.swift
//  QuizApp
//
//  Created by Dylan Archer on 7/5/2024.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject var viewModel :CategoriesViewModel
    @ObservedObject var quizEndViewModel = QuizEndViewModel()
    
    init(difficulty: String, amount :Double) {
        _viewModel = StateObject(wrappedValue: CategoriesViewModel(
            difficulty: difficulty, amount: amount))
    }
    
    let categoriesWithImages: [(String, String)] = [
        ("General Knowledge", "lightbulb.min.fill"),
        ("Books", "book.fill"),
        ("Film", "movieclapper.fill"),
        ("Music", "music.note"),
        ("Theatre", "theatermasks.fill"),
        ("TV", "tv.fill"),
        ("Videogames", "gamecontroller.fill"),
        ("Board Games", "arcade.stick.console.fill"),
        ("Science & Nature", "atom"),
        ("Computers", "desktopcomputer"),
        ("Mathematics", "x.squareroot"),
        ("Mythology", "fossil.shell.fill"),
        ("Sports", "football.fill"),
        ("Geography", "globe.europe.africa.fill"),
        ("History", "clock.fill"),
        ("Politics", "person.wave.2.fill"),
        ("Art", "paintbrush.pointed.fill"),
        ("Celebrities", "figure"),
        ("Animals", "pawprint.fill"),
        ("Vehicles", "car.fill"),
        ("Comics", "book.pages.fill"),
        ("Gadgets", "flipphone"),
        ("Anime", "figure.2"),
        ("Cartoons", "figure.walk")
    ]
    
    var body: some View {
        VStack {
            Text("Quiz Categories")
                .font(.system(size: 40))
                .bold()
                .lineLimit(nil)
                .padding(30)
            Spacer()
            List(categoriesWithImages, id: \.0) { category, imageName in
                NavigationLink(destination: QuizStartView(amount: Int(viewModel.amount), category: category, difficulty: viewModel.difficulty)) {
                    HStack {
                        Image(systemName: imageName)
                        Text(category)
                            .font(.system(size: 26))
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        CategoriesView(difficulty: "easy", amount: 5)
    }
}
