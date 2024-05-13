//
//  AuthenticationManager.swift
//  QuizApp
//
//  Created by Shakil Sharif on 9/5/2024.
//

/* import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email

    }
}

enum AuthProviderOpt: String {
    case email = "password"
    case google = "google.com"
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() {}
    
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse) //Put custom error
        }
        
        return AuthDataResultModel(user: user)
    }
    
    func getProvider() throws -> [AuthProviderOpt] {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        
        var providers: [AuthProviderOpt] = []
        for provider in providerData {
            if let option = AuthProviderOpt(rawValue: provider.providerID) {
                providers.append(option)
            } else {
                assertionFailure("Provider option not found: \(provider.providerID)")
            }
        }
             return providers
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
        
    }

extension AuthenticationManager {
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataresult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataresult.user)
    }
    
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }

    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }

}


extension AuthenticationManager {
    
    @discardableResult
    func signWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel{
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
        
    }
    
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel{
        let authDataResult = try await  Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
        
    }
} */
