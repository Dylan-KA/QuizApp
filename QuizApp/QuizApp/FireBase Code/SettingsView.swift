//
//  SettingsView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 12/5/2024.
//

/*import SwiftUI


@MainActor
final class SettingsViewModel: ObservableObject {
    
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist) // Create custom error
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
}
    struct SettingsView: View {
        
        @StateObject private var viewModel = SettingsViewModel()
        @Binding var showSignInView: Bool
        
        var body: some View {
            List {
                Button("Log Out") {
                    Task {
                        do {
                            try viewModel.signOut()
                            showSignInView = true
                            
                        } catch {
                            print(error)
                            
                        }
                    }
                }
                
                Button("Reset Password") {
                    Task {
                        do {
                            try await viewModel.resetPassword()
                            print("Password Reset")
                            
                        } catch {
                            print(error)
                            
                        }
                    }
                }
                
            }
            .navigationBarTitle("Settings")
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                SettingsView(showSignInView: .constant(false))
            }
        }
    } */
