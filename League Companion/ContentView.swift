//
//  ContentView.swift
//  League Companion
//
//  Created by Yaniv Naggar on 6/8/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showMyLeagues = false // State variable for navigation
    @State private var showLoginView = false // State variable for navigation to LoginView

    var body: some View {
        if showMyLeagues {
            MyLeaguesView() // This view should be navigated when signup/login is successful
        } else if showLoginView {
            LoginView() // This view should be navigated when login button is clicked
        } else {
            content
        }
    }
    var content: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("logo") // Add your app logo image here
                    .resizable()
                    .frame(width: 100, height: 100)
                
                VStack(spacing: 16) {
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Handle sign up
                    Auth.auth().createUser(withEmail: username, password: password) { (authResult, error) in
                        if let error = error {
                            // An error occurred while creating the user
                            print("Error occurred: \(error.localizedDescription)")
                        } else {
                            // User was created successfully
                            print("User created successfully!")
                            self.showMyLeagues = true // Set the state variable to trigger navigation
                        }
                    }
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                Button(action: {
                    // Navigate to LoginView when button is clicked
                    self.showLoginView = true
                }) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
    }
}

struct MyLeaguesView: View {
    var body: some View {
        Text("My Leagues")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
