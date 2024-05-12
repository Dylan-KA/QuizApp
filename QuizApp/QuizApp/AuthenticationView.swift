//
//  AuthenticationView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 9/5/2024.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String
    let name: String?
}

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    
    func signInGoogle() async throws {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost) // create custom error
        }
                
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
    
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse) // create custom error
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let name = gidSignInResult.user.profile?.name
        
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken, name: name)
        try await AuthenticationManager.shared.signWithGoogle(tokens: tokens)
        
    }
}

struct AuthenticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack{
            
            NavigationLink{
                SignInWithEmail()
            } label: {
                Text("Sign up with Email")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal), action: {
                Task {
                    do {
                        try await viewModel.signInGoogle()
                        // Handle successful sign-in, perhaps update UI or navigate away
                    } catch {
                        print("Google Sign-In failed: \(error.localizedDescription)")
                        // Handle errors, perhaps show an alert or update UI accordingly PUT CUSTOM ERROR
                    }
                }
            })
            
        }
        .padding()
        .navigationTitle("Sign In")
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AuthenticationView(showSignInView: .constant(true))
        }
    }
}
