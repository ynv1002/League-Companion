//
//  MyLeague's.swift
//  League Companion
//
//  Created by Yaniv Naggar on 6/8/23.
//

import SwiftUI

struct MyLeagueView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LoginView()) {
                    Text("Log In")
                }
            }
            
        }
    }
    
    
    struct MyLeagueView_Previews: PreviewProvider {
        static var previews: some View {
            MyLeagueView()
        }
    }
}
