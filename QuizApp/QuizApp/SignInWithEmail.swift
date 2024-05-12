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
    @Published var isSignUp = true // Add this to toggle between sign in and sign up
    
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
                print("Success")
                print(returnUserData)
            } catch {
                print("Error \(error)")
            }
        }
    }
}

struct SignInWithEmail: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                viewModel.authenticate()
            } label: {
                Text(viewModel.isSignUp ? "Sign Up" : "Sign In")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Button("Switch to \(viewModel.isSignUp ? "Sign In" : "Sign Up")") {
                viewModel.isSignUp.toggle()
            }
            .padding(.top)
        }
        .padding()
        .navigationTitle(viewModel.isSignUp ? "Sign Up With Email" : "Sign In With Email")
    }
}


struct SignInWithEmail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignInWithEmail()
        }
    }
}
