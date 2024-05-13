//
//  EntryView.swift
//  QuizApp
//
//  Created by Shakil Sharif on 13/5/2024.
//

import SwiftUI

struct EntryView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Welcome To Quizzify")
                .font(.system(size: 50, weight: .bold))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 25)
            
            Text("Select An Option To Begin")
                .font(.system(size: 20, weight: .bold))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
                .opacity(0.7)
           
            NavigationLink {
                CreateAccountView()
            } label: {
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
            
            NavigationLink {
                LoginView()
            } label: {
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
        }
        .padding(70)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    NavigationStack{
        EntryView()
    }
}
