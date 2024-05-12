//
//  SignInWithEmail.swift
//  QuizApp
//
//  Created by Shakil Sharif on 9/5/2024.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isSignUp = true
    @Published var shouldNavigate = false  // Publish navigation trigger

    func authenticate() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password")
            return
        }
        
        Task {
            do {
                let returnUserData: AuthDataResultModel
                if isSignUp {
                    returnUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                } else {
                    returnUserData = try await AuthenticationManager.shared.signInUser(email: email, password: password)
                }
                print("Success: \(returnUserData)")
                DispatchQueue.main.async {
                    self.shouldNavigate = true  // Set this to trigger navigation
                }
            } catch {
                print("Authentication Error: \(error)")
            }
        }
    }
}

struct SignInWithEmail: View {
    @StateObject private var viewModel = SignInEmailViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Email...", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                
                SecureField("Password...", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                
                Button("Sign Up / Sign In") {
                    viewModel.authenticate()
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top)
                
                NavigationLink(value: viewModel.shouldNavigate) {
                    EmptyView()
                }
            }
            .navigationDestination(isPresented: $viewModel.shouldNavigate) {
                WelcomeView()
            }
            .padding()
            .navigationTitle(viewModel.isSignUp ? "Sign Up With Email" : "Sign In With Email")
        }
    }
}

struct SignInWithEmail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignInWithEmail()
        }
    }
}

