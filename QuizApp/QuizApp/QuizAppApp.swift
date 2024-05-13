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
   
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        // Setting up Firebase App Check only for real devices, not simulators
        #if targetEnvironment(simulator)
        print("Firebase App Check is not enabled on simulator.")
        #else
        // This sets up the DeviceCheck provider for App Check on real devices
        if #available(iOS 14, *) {
            AppCheck.setAppCheckProviderFactory(DeviceCheckProviderFactory())
        } else {
            // Handle older iOS versions if necessary
            print("DeviceCheck is not available on iOS versions older than 14.")
        }
        #endif
        
        return true
    }
}
