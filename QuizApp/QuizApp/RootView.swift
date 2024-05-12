//
//  RootView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 12/5/2024.
//

import SwiftUI


struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack{
                NavigationStack {
                    AuthenticationView(showSignInView: $showSignInView)
                }
        }
        .onAppear {
            let authenticatedUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authenticatedUser == nil
            
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                SettingsView(showSignInView: .constant(true))
            }
        
        }
        
    }
}

#Preview {
    RootView()
}
