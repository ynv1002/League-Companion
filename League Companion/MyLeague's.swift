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
                NavigationLink(destination: newLeauge()) {
                    Text("Create new leauge").padding().background(Color.blue)
                }
                Spacer()
                NavigationLink(destination: joinLeauge()){
                    Text("Join a leauge").padding().background(Color.green)
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
