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

    @AppStorage("currentUsername") var storedUsername: String?

    func createUserAccount() {
        var users = UserDefaults.standard.array(forKey: "users") as? [[String: String]] ?? []
        if !users.contains(where: { $0["username"] == username }) {
            users.append(["username": username, "password": password])
            UserDefaults.standard.set(users, forKey: "users")
            accountCreated = true
            storedUsername = username  // Store the newly created username
        } else {
            print("Username already exists")
        }
    }
}

