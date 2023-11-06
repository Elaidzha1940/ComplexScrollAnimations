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
    Card(BgColor: .black.opacity(0.6), balance: "$ 128,000"),
    Card(BgColor: .black.opacity(0.7), balance: "$ 193,000"),
    Card(BgColor: .gray.opacity(0.6), balance: "$ 55,000"),
    Card(BgColor: .black.opacity(0.5), balance: "$ 309,333"),
    Card(BgColor: .black.opacity(0.2), balance: "$ 103,222"),
    
]
