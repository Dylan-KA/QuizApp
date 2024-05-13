//
//  LoginViewModel.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI
import Foundation

class LoginViewModel: ObservableObject {
    
    //Variables for login functionality. Array for Username
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var usernames: [String] = []
    @Published var isLoggedIn = false
    @Published var errorMessage: String = ""

    //Stores Username that's logged in to be used throughout the app
    @AppStorage("currentUsername") var storedUsername: String?

    //Fetches saves username for wheel picker
    init() {
        fetchUsernames()
    }

    private func fetchUsernames() {
        let users = UserDefaults.standard.array(forKey: "users") as? [[String: String]] ?? []
        self.usernames = users.map { $0["username"] ?? "" }.filter { !$0.isEmpty }
    }
   
    //Login functionality, with error messages for Invalid Password
    func login() {
        let users = UserDefaults.standard.array(forKey: "users") as? [[String: String]] ?? []
        if let user = users.first(where: { $0["username"] == username }) {
            if user["password"] == password {
                isLoggedIn = true
                storedUsername = username  // Updates @AppStorage with the current username
                errorMessage = ""
            } else {
                errorMessage = "Invalid Password"
            }
        } else {
            errorMessage = "Username not found"
        }
    }
}

