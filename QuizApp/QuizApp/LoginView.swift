//
//  LoginView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @StateObject var quizEndViewModel = QuizEndViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Select An Account")
                    .font(.system(size: 40, weight: .bold))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 1)
                
                // Username selection or entry
                Picker("Username", selection: $viewModel.username) {
                    ForEach(viewModel.usernames, id: \.self) { name in
                        Text(name)
                            .tag(name)
                            .font(.system(size: 25, weight: .medium))
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding(.horizontal)
                .padding(.bottom, 5)
                
                // Password entry
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .font(.headline)
                    .frame(width: 275, height: 55)
                    .background(Color.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                // Login button
                Button("Login") {
                    viewModel.login()
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
                        quizEndViewModel.user = viewModel.username
                        print(quizEndViewModel.user)
                    }
                )
                
                Spacer()
            }
            .padding(70)
            .background(Color(.systemGray6))
            .edgesIgnoringSafeArea(.all)
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                WelcomeView()
            }
        }
    }
}

// Preview

#Preview {
    LoginView()
}



// Make me user profiles also
