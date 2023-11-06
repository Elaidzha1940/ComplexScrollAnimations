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
    Card(BgColor: Color("Choc"), balance: "$ 128,000"),
    Card(BgColor: Color("ChocD"), balance: "$ 193,000"),
    Card(BgColor: Color("NegroniD"), balance: "$ 55,000"),
    Card(BgColor: Color("Negroni"), balance: "$ 309,333"),
    Card(BgColor: Color("Sien"), balance: "$ 103,222"),
    
]
