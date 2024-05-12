//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by Dylan Archer on 30/4/2024.
//

import SwiftUI
import Firebase

@main
struct QuizAppApp: App {
   
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AuthenticationView(showSignInView: .constant(true))
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
