//
//  CreateAccountViewModel.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI
import Foundation

class CreateAccountViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var accountCreated = false
    @Published var usernameErrorMessage: String = ""
    @Published var passwordErrorMessage: String = ""

    @AppStorage("currentUsername") var storedUsername: String?

    func createUserAccount() {
        var users = UserDefaults.standard.array(forKey: "users") as? [[String: String]] ?? []

        usernameErrorMessage = ""
        passwordErrorMessage = ""

        if users.contains(where: { $0["username"] == username }) {
            usernameErrorMessage = "Username already exists"
            return
        }

        if password.count < 8 {
            passwordErrorMessage = "Password must be at least 8 characters long"
            return
        }

        users.append(["username": username, "password": password])
        UserDefaults.standard.set(users, forKey: "users")
        accountCreated = true
        storedUsername = username
    }
}



