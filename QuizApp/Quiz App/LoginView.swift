//
//  LoginView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI

struct LoginView: View {
    // Stateobject that initialises viewModel for Login
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Header for page
                Text("Select An Account")
                    .font(.system(size: 40, weight: .bold))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 1)
                
                // Error if the incorrect password is used
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                // Selection wheel to select a saved username
                Picker("Username", selection: $viewModel.username) {
                    ForEach(viewModel.usernames, id: \.self) { name in
                        Text(name)
                            .tag(name)
                            .font(.system(size: 25, weight: .medium))
                    }
                }
                // Style attiributes of wheel
                .pickerStyle(WheelPickerStyle())
                .padding(.horizontal)
                .padding(.bottom, 5)
                
                // Secure entry field for password
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .font(.headline)
                    .frame(width: 275, height: 55)
                    .background(Color.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                // Button to login once correct password is entered, taking user to WelcomeVieww
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                .font(.system(size: 24))
                .bold()
                .frame(width: 250, height: 55)
                .background(Color.cyan)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .padding()
                .simultaneousGesture(
                    TapGesture()
                    .onEnded {
                        //quizEndViewModel.user = viewModel.username
                        //print(quizEndViewModel.user)
                    }
                )
                
                Spacer()
            }
            .padding(70)
            .background(Color(.systemGray6)) //Background Colour
            .edgesIgnoringSafeArea(.all) //Pushes colour within safe areas
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                WelcomeView()
                // Navigation to WelcomeView once user has succefully logged in
            }
        }
    }
}

#Preview {
    LoginView()
}
