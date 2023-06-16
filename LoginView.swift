//
//  LoginView.swift
//  League Companion
//
//  Created by Yaniv Naggar on 6/8/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false  // Add a state variable for navigation

    var body: some View {
        ZStack {
            // Add a background gradient
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            if isLoggedIn {
                MyLeagueView() // This view should be navigated when login is successful
            } else {
                loginContent
            }
        }
    }
    
    var loginContent: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            TextField("Email", text: $email)
                .textFieldStyle()
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle()
                .autocapitalization(.none)
            
            Button(action: {
                login(email: email, password: password)
            }) {
                Text("Login")
                    .buttonStyle()
            }
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3))
        .cornerRadius(20)
        .shadow(color: .black, radius: 10, x: 0, y: 10)
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("An error occurred: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                self.isLoggedIn = true // Set the state variable to trigger navigation
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
