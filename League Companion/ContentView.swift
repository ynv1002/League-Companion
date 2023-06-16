import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showMyLeagues = false
    @State private var showLoginView = false

    var body: some View {
        ZStack {
            // Add a background gradient
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            if showMyLeagues {
                MyLeagueView()
            } else if showLoginView {
                LoginView()
            } else {
                mainContent
                    .padding()
            }
        }
    }

    var mainContent: some View {
        VStack(spacing: 20) {
            logoImage
            inputFields
            signUpButton
            logInButton
        }
        .padding(.horizontal, 24)
        .foregroundColor(.white) // Set the default text color to white
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3)) // Give the main content a semi-transparent background
        .cornerRadius(20) // Round the corners
        .shadow(color: .black, radius: 10, x: 0, y: 10) // Add a shadow
    }

    var logoImage: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .shadow(color: .black, radius: 10) // Add a shadow to the logo
    }

    var inputFields: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $username)
                .textFieldStyle()

            SecureField("Password", text: $password)
                .textFieldStyle()
        }
    }

    var signUpButton: some View {
        Button(action: signUpAction) {
            Text("Sign Up")
                .buttonStyle()
        }
    }

    var logInButton: some View {
        Button(action: logInAction) {
            Text("Log In")
                .buttonStyle()
        }
    }

    func signUpAction() {
        // Handle sign up
        Auth.auth().createUser(withEmail: username, password: password) { (authResult, error) in
            if let error = error {
                print("Error occurred: \(error.localizedDescription)")
                // TODO: Show alert to the user
            } else if let user = authResult?.user {
                print("User created successfully!")
                createUserDocument(user: user)
                self.showMyLeagues = true
            }
        }
    }

    func logInAction() {
        self.showLoginView = true
    }
}

extension View {
    func textFieldStyle() -> some View {
        self
            .padding()
            .background(Color.white.opacity(0.2))
            .cornerRadius(8)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
            .foregroundColor(.white)
    }

    func buttonStyle() -> some View {
        self
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white).opacity(0.1))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 1))
            .shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
