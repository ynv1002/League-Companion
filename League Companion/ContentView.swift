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
    @State private var showMyLeagues = false // Add a state variable for navigation
    
    var body: some View {
        if showMyLeagues{
            MyLeagueView()
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
                }
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
