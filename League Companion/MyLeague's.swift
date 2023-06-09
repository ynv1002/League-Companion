//
//  MyLeague's.swift
//  League Companion
//
//  Created by Yaniv Naggar on 6/8/23.
//

import Foundation

print("Your Fantasy Football Leauges:" \n)

Button() {
  Text("Add New Leauge")
  func addLeauge(name: string){
    var rosterPositions: [String: Int] = ["QB": 0, "RB": 0, "WR": 0, "TE": 0, "FLX": 0, "DST": 0, "K": 0, "Bench": 0]
    for position in rosterPositions {
      Text("Enter quantity for ", position, "position")
      rosterPositions[position] = readLine()   
    }
  }
}
