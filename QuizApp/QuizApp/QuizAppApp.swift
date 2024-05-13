//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by Dylan Archer on 30/4/2024.
//

import SwiftUI
import Firebase
import FirebaseAppCheck

@main
struct QuizAppApp: App {
   
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EntryView()
            }
        }
    }
}
