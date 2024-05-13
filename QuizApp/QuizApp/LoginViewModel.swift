//
//  LoginViewModel.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI
import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var usernames: [String] = []
    @Published var isLoggedIn = false
    @Published var errorMessage: String = ""

    @AppStorage("currentUsername") var storedUsername: String?

    init() {
        fetchUsernames()
    }

    private func fetchUsernames() {
        let users = UserDefaults.standard.array(forKey: "users") as? [[String: String]] ?? []
        self.usernames = users.map { $0["username"] ?? "" }.filter { !$0.isEmpty }
    }

    func login() {
        let users = UserDefaults.standard.array(forKey: "users") as? [[String: String]] ?? []
        if let user = users.first(where: { $0["username"] == username }) {
            if user["password"] == password {
                isLoggedIn = true
                storedUsername = username  // Update @AppStorage with the current username
                errorMessage = ""
            } else {
                errorMessage = "Invalid Password"
            }
        } else {
            errorMessage = "Username not found"
        }
    }
}

