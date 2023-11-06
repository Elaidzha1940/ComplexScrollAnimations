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
                        .frame(height: 50)
                        .padding()
                    
                    GeometryReader {
                        let rect = $0.frame(in: .scrollView)
                        
                        // MARK: Card View
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(cards) { card in
                                    CardView(card)
                                        .containerRelativeFrame(.horizontal)
                                    
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.paging)
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
    // MARK: Card View
    @ViewBuilder
    func CardView(_ card: Card) -> some View {
        GeometryReader {
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            let minY = rect.minY
            
            ZStack {
                Rectangle()
                //RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(card.BgColor)
                    .overlay(alignment: .leading) {
                        Circle()
                            .fill(card.BgColor)
                            .overlay {
                                Circle()
                                    .fill(.white.opacity(0.2))
                            }
                            .scaleEffect(2, anchor: .topLeading)
                            .offset(x: -40, y: -50)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
                
                VStack(alignment: .leading, spacing: 5) {
                    Spacer(minLength: 0)
                    
                    Text("Current Balance")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                    
                    Text(card.balance)
                        .font(.system(size: 19, weight: .semibold, design: .rounded))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
            }
        }
        .padding(.horizontal, 10)
    }
    
    // MARK: Expense Card View
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
