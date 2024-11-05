//
//  SignInWithEmail.swift
//  QuizApp
//
//  Created by Shakil Sharif on 9/5/2024.
//

/* import SwiftUI

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
            VStack(spacing: 20) {
                Text(viewModel.isSignUp ? "Sign Up With Email" : "Sign In With Email")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)

                Divider()
                    .frame(width: 250, height: 4)
                    .background(Color.black)
                    .padding(.vertical, 20)

                TextField("Email...", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)

                SecureField("Password...", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)

                Button(viewModel.isSignUp ? "Sign Up" : "Sign In") {
                    viewModel.authenticate()
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top)

                Button(action: {
                    viewModel.isSignUp.toggle()
                }) {
                    Text(viewModel.isSignUp ? "Already have an account? Sign In" : "Need an account? Sign Up")
                        .underline()
                        .foregroundColor(.blue)
                }
                .padding(.top, 8)
                
                NavigationLink(value: viewModel.shouldNavigate) {
                    EmptyView()
                }
            }
            .navigationDestination(isPresented: $viewModel.shouldNavigate) {
                WelcomeView()
                
            }
            .padding()
        }
    }
}

struct SignInWithEmail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignInWithEmail()
        }
    }
} */


/*truct SignInWithEmail: View {
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
} */

