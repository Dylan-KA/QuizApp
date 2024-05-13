//
//  CreateAccountView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI

struct CreateAccountView: View {
    
    @StateObject private var viewModel = CreateAccountViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Create Your Account")
                    .font(.system(size: 45, weight: .bold))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 25)
                
                TextField("Username", text: $viewModel.username)
                    .padding()
                    .font(.headline)
                    .frame(width: 275, height: 55)
                    .background(Color.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .font(.headline)
                    .frame(width: 275, height: 55)
                    .background(Color.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
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
            }
            .padding(70)
            .background(Color(.systemGray6))
            .edgesIgnoringSafeArea(.all)
            .navigationDestination(isPresented: $viewModel.accountCreated) {
                WelcomeView()
            }
        }
    }
}


#Preview {
    CreateAccountView()
}
