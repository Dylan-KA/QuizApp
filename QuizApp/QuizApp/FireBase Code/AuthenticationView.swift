//
//  AuthenticationView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 9/5/2024.
//

/* import SwiftUI
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
    
    @Published var isSignInSuccessful = false  // Track sign-in success

    func signInGoogle() async {
        do {
            guard let topVC = Utilities.shared.topViewController() else {
                throw URLError(.cannotFindHost)  // Handle missing host scenario
            }
            
            let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
            
            // Assuming `tokenString` is non-optional based on the SDK's documentation
            guard let idToken = gidSignInResult.user.idToken?.tokenString else {
                throw URLError(.badServerResponse) // create custom error
            }
            let accessToken = gidSignInResult.user.accessToken.tokenString
            
            let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken, name: gidSignInResult.user.profile?.name)
            let authResult = try await AuthenticationManager.shared.signWithGoogle(tokens: tokens)
            
            // If sign-in is successful and user data is returned
            if !authResult.uid.isEmpty {
                isSignInSuccessful = true  // Update sign-in success state
            }
        } catch {
            print("Google Sign-In failed: \(error.localizedDescription)")
            isSignInSuccessful = false  // Ensure sign-in is marked unsuccessful on error
        }
    }
}



struct AuthenticationView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Divider()
                    .frame(width: 250, height: 4)
                    .background(Color.black)
                    .padding(.vertical, 20)

                NavigationLink(destination: SignInWithEmail()) {
                    Text("Sign up with Email")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal), action: {
                    Task {
                        await viewModel.signInGoogle()
                        if viewModel.isSignInSuccessful {
                            showSignInView = false  // Use this to control navigation
                        }
                    }
                })

                Spacer()
            }
            .padding()
        }
    }
} */











/* import SwiftUI
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
    @Binding var showSignInView: Bool  // This binding can be used to control visibility or navigation

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Divider()
                    .frame(width: 250, height: 4)
                    .background(Color.black)
                    .padding(.vertical, 20)

                NavigationLink(destination: SignInWithEmail()) {
                    Text("Sign up with Email")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal), action: {
                    Task {
                        do {
                            try await viewModel.signInGoogle()
                            showSignInView = false  // Directly update this to false to navigate away upon success
                        } catch {
                            print("Google Sign-In failed: \(error.localizedDescription)")
                        }
                    }
                })


                Spacer()
            }
            .padding()

        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AuthenticationView(showSignInView: .constant(true))
        }
    }
}
*/
