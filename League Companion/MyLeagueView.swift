//
//  MyLeagueView.swift
//  League Companion
//
//  Created by Yaniv Naggar on 6/8/23.
//

import SwiftUI

struct MyLeagueView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Add a background gradient
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    NavigationLink(destination: CreateNewLeagueView()) {
                        Text("Create New League")
                            .navigationButtonStyle()
                    }
                    NavigationLink(destination: JoinLeagueView()) {
                        Text("Join League")
                            .navigationButtonStyle()
                    }
                    NavigationLink(destination: CurrentLeagueView()) {
                        Text("My Leagues")
                            .navigationButtonStyle()
                    }
                }
                .padding(.horizontal, 24)
                .foregroundColor(.white) // Set the default text color to white
                .navigationBarTitle("My League View", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "person.crop.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

// Extend View to define the style of the navigation buttons
extension View {
    func navigationButtonStyle() -> some View {
        self
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white).opacity(0.1)) // Use a semi-transparent background
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 1)) // Add a border to the button
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5) // Add a shadow effect to the buttons
    }
}

struct MyLeagueView_Previews: PreviewProvider {
    static var previews: some View {
        MyLeagueView()
    }
}
