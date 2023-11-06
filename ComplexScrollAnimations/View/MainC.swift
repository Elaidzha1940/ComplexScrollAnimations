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
    @State private var activeCard: UUID?
    
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
                        let minY = rect.minX.rounded()
                        
                        // MARK: Card View
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(cards) { card in
                                    ZStack {
                                        if minY == 75.0 {
                                            // Not Scrolled
                                            // Showing All Cards
                                            CardView(card)
                                        } else {
                                            // Scrolled
                                            // Showing Only Selected Card
                                            if activeCard == card.id {
                                                CardView(card)
                                            } else {
                                                Rectangle()
                                                    .fill(.clear)
                                            }
                                        }
                                    }
                                    .containerRelativeFrame(.horizontal)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollPosition(id: $activeCard)
                        .scrollTargetBehavior(.paging)
                        .scrollClipDisabled()
                        .scrollIndicators(.hidden)
                        .scrollClipDisabled(minY != 75.0)
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
                .mask {
                    Rectangle()
                        .visualEffect { content, proxy in
                            content
                                .offset(y: backgroundLimitOffset(proxy))
                        }
                }
                .background(
                    GeometryReader {
                        let rect = $0.frame(in: .scrollView)
                        let minY = min(rect.minY - 125, 0)
                        let progress = max(min(-minY / 25, 1), 0)
                        
                        RoundedRectangle(cornerRadius: 30 * progress, style: .circular)
                            .fill(scheme == .dark ? .black : .white)
                        
                        // Limiting Bg Scroll belowthe header
                            .visualEffect { content, proxy in
                                content
                                    .offset(y: backgroundLimitOffset(proxy))
                            }
                    }
                )
            }
            .padding(.vertical, 15)
        }
        .scrollTargetBehavior(CustomScrollBehavior())
        .scrollIndicators(.hidden)
        .onAppear {
            if activeCard == nil {
                activeCard = cards.first?.id
            }
        }
        .onChange(of: activeCard) { oldValue, newValue in
            withAnimation(.spring()) {
                allExpense = expenses.shuffled()
            }
        }
    }
    
    // Bg Limit Offset
    func backgroundLimitOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        
        return minY < 100 ? -minY + 100 : 0
    }

    // MARK: Card View
    @ViewBuilder
    func CardView(_ card: Card) -> some View {
        GeometryReader {
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            let _minY = rect.minY
            let topValue: CGFloat = 75.0
            
            let offset = min(rect.minY - topValue, 0)
            let progress = max(min(-offset / topValue, 1), 0)
            let scale: CGFloat = 1 + progress
            
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
                    .scaleEffect(scale, anchor: .bottom)
                
                VStack(alignment: .leading, spacing: 5) {
                    Spacer(minLength: 0)
                    
                    Text("Current Balance")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                    
                    Text(card.balance)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
                .offset(y: progress * -25)
            }
            .offset(y: -offset)
            
            // Moving til Top Value
            .offset(y: progress * -topValue)
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

// Custom Scroll Target Behavior
// AKA scrollViewEndDragging in UIKit

struct CustomScrollBehavior: ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        if target.rect.minY < 75 {
            target.rect = .zero
        }
    }
}


#Preview {
    ContentView()
}
