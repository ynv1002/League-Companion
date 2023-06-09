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

    var body: some View {
        VStack {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Button(action: {
                // Handle sign up
                Auth.auth().createUser(withEmail: username, password: password) { (authResult, error) in
                    if let error = error {
                        // An error occurred while creating the user
                        print("Error occurred: \(error.localizedDescription)")
                    } else {
                        // User was created successfully, now you can navigate them into the app, or do other things like sending verification email etc.
                        print("User created successfully!")
                    }
                }
            }) {
                Text("Sign Up")
            }
        }
        .padding()
    }
}
