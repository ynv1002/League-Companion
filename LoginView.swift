//
//  LoginView.swift
//  League Companion
//
//  Created by Yaniv Naggar on 6/8/23.
//

import SwiftUI
import Firebase

func login(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        if let error = error {
            print("An error occurred: \(error.localizedDescription)")
        } else {
            print("User logged in successfully")
            MyLeagueView()
            // Navigate to your main app view
        }
    }
}
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)

            TextField("Email", text: $email)
                .padding()
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .padding()
                .autocapitalization(.none)

            Button(action: {
                login(email: email, password: password)
            }) {
                Text("Login")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }.padding()
    }
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }

}

