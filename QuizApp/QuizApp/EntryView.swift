//
//  EntryView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI

struct EntryView: View {
    
    // StateObject that intialises viewModel for login process
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            // Header of Quiz App, and relevant design attributes
            Text("Welcome To Quizzify")
                .font(.system(size: 50, weight: .bold))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 25)
            
            // Subheeader of Quiz App, and relevant design attributes
            Text("Select An Option To Begin")
                .font(.system(size: 20, weight: .bold))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
                .opacity(0.7)
           
            // Allows Navigation to Create Account page when clciking "Create Account" button
            NavigationLink {
                CreateAccountView()
            } label: {
                
                // Text for button
                Text("Create Account")
                    .font(.system(size: 24))
                    .bold()
                    .frame(width: 250)
                    .frame(height: 60)
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
            .padding(.bottom, 0)
            
            
             // Allows Navigation to Login page when clciking "Login" button
            NavigationLink {
                LoginView()
            } label: {
                // Text for button
                Text("Login")
                    .font(.system(size: 24))
                    .bold()
                    .frame(width: 250)
                    .frame(height: 60)
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
            .padding()
            
            Spacer()
            // Spacing and padding around the button and bottom areas
        }
        .padding(70)
        .background(Color(.systemGray6)) //Sets background colour
        .edgesIgnoringSafeArea(.all) //Extends background colour to cover safe areas
    }
}


#Preview {
    NavigationStack{
        EntryView()
    }
}
