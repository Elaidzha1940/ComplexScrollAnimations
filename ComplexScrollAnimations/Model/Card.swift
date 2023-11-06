//
//  Card.swift
//  ComplexScrollAnimations
//
//  Created by Elaidzha Shchukin on 06.11.2023.
//

import SwiftUI

// Card Model and Sample Cards

struct Card: Identifiable {
    var id: UUID = .init()
    var BgColor: Color
    var balance: String
}

var cards : [Card] = [
    Card(BgColor: .brown, balance: "888,000"),
    Card(BgColor: .cyan, balance: "193,000"),
    Card(BgColor: .green, balance: "55,000"),
    Card(BgColor: .mint, balance: "309,333"),
    Card(BgColor: .orange, balance: "103,222"),
    
]
