//  /*
//
//  Project: ComplexScrollAnimations
//  File: MainC.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.11.2023
//
//  */

import SwiftUI

struct MainC: View {
    // View Properties
    @State private var allExpense: [Expense] = []
    
    // Envirnment Values
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(spacing: 0){
                VStack(alignment: .leading, spacing: 15) {
                    Text("Elid.ev")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .padding()
                    
                    GeometryReader {
                        let rect = $0.frame(in: .scrollView)
                        
                        // Card View
                    }
                    .frame(height: 120)
                }
                
                LazyVStack(spacing: 15) {
                    Menu {
                        
                    } label: {
                        HStack(spacing: 5) {
                            Text("Filter By")
                            Image(systemName: "chevron.down")
                        }
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    ForEach(allExpense) { expense in
                        ExpenseCardView(expense)
                    }
                }
                .padding(15)
            }
            .padding(.vertical, 15)
        }
        .scrollIndicators(.hidden)
        .onAppear {
            allExpense = expenses.shuffled()
        }
    }
    // Card View
    @ViewBuilder
    func CardView() -> some View {
        
    }
    
    // Expense Card View
    @ViewBuilder
    func ExpenseCardView(_ expense: Expense) -> some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(expense.product)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                
                Text(expense.spend)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
            
            Text(expense.amountSpent)
                .font(.system(size: 17, weight: .bold, design: .rounded))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 5)
    }
}

#Preview {
    ContentView()
}
