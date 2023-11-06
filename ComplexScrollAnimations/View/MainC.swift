//  /*
//
//  Project: ComplexScrollAnimations
//  File: MainC.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.11.2023
//
//  */

import SwiftUI
// View Properties
@State private var allExpense: [Expense] = []

struct MainC: View {
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(spacing: 0){
                VStack(alignment: .leading, spacing: 15) {
                    Text("Elid.ev")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
