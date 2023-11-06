//  /*
//
//  Project: ComplexScrollAnimations
//  File: Expense.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.11.2023
//
//  */

import Foundation

// Sample Expense
struct Expense: Identifiable {
    var id: UUID = UUID()
    var amountSpent: String
    var product: String
    var spend:String
}

var expenses: [Expense] = [

Expense(amountSpent: "$ 99", product: "Amazon", spend: "Groceries"),
Expense(amountSpent: "$ 88", product: "YouTube", spend: "Streaming"),
Expense(amountSpent: "$ 77", product: "Cinema", spend: "Tickets"),
Expense(amountSpent: "$ 66", product: "Shell", spend: "Gasolin"),
Expense(amountSpent: "$ 55", product: "Itunes", spend: "Music"),
Expense(amountSpent: "$ 100", product: "Figma", spend: "Member"),
Expense(amountSpent: "$ 58", product: "Netflix", spend: "Streming"),
Expense(amountSpent: "$ 10", product: "Shop", spend: "Water"),
Expense(amountSpent: "$ 100", product: "Market", spend: "Vegies"),
Expense(amountSpent: "$ 130", product: "Apple", spend: "Macbook Pro"),
Expense(amountSpent: "$ 39", product: "Restaurant", spend: "Dinner"),

]
