//
//  CreateAccountViewModel.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI
import Foundation

class CreateAccountViewModel: ObservableObject {
    // Published variables to be used for UserDefaults
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var accountCreated = false
    @Published var usernameErrorMessage: String = ""
    @Published var passwordErrorMessage: String = ""

    // Stores username in real-time to be used throughout the app
    @AppStorage("currentUsername") var storedUsername: String?

    // Array function to store Usernames
    func createUserAccount() {
        var users = UserDefaults.standard.array(forKey: "users") as? [[String: String]] ?? []

        // Default value for Username and Password
        usernameErrorMessage = ""
        passwordErrorMessage = ""

        // Checks and prevents duplicate Usernames being created
        if users.contains(where: { $0["username"] == username }) {
            usernameErrorMessage = "Username already exists"
            return
        }
        
        // Makes sure password length is 8 characters atleast
        if password.count < 8 {
            passwordErrorMessage = "Password must be at least 8 characters long"
            return
        }
        // Adds Username and Password to array
        users.append(["username": username, "password": password])
        UserDefaults.standard.set(users, forKey: "users")
        accountCreated = true
        storedUsername = username
    }
}



