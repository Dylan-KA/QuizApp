//
//  CreateAccountView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI

struct CreateAccountView: View {
    // Stateobject that initialises viewModel for Create Account
    @StateObject private var viewModel = CreateAccountViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Header of Create Page, and relevant design attributes
                Text("Create Your Account")
                    .font(.system(size: 45, weight: .bold))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 25)
                
                // Error message when user enters already used Username
                if !viewModel.usernameErrorMessage.isEmpty {
                    Text(viewModel.usernameErrorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                // Entry field for user to enter Username, and relevant design attributes
                TextField("Username", text: $viewModel.username)
                    .padding()
                    .font(.headline)
                    .frame(width: 275, height: 55)
                    .background(Color.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                // Error message when user enters already used Password
                if !viewModel.passwordErrorMessage.isEmpty {
                    Text(viewModel.passwordErrorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                // Secure entry field for user to enter Password, and relevant design attributes
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .font(.headline)
                    .frame(width: 275, height: 55)
                    .background(Color.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                // Button to create the account for user
                Button(action: viewModel.createUserAccount) {
                    Text("Create Account")
                        .font(.system(size: 24))
                        .bold()
                        .frame(maxWidth: 250)
                        .frame(height: 60)
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                .padding()
                
                Spacer()
            } // Spacing between button and bottom area. Navigation link to WelcomeView once account created
            .padding(70)
            .background(Color(.systemGray6)) // Sets background colour
            .edgesIgnoringSafeArea(.all) //Extends background colour within safe areas
            .navigationDestination(isPresented: $viewModel.accountCreated) {
                WelcomeView()
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
