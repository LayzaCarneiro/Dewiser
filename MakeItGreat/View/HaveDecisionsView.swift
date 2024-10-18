//
//  HaveDecisionsView.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 09/10/24.
//

import SwiftUI
import SwiftData

struct HaveDecisionsView: View {
    @State private var isPresented: Bool = false
    @Query var decisions: [CardModel]
    @State private var deleteOnForDecision: Bool = false
    @Environment(\.modelContext) var context
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Color.clear.ignoresSafeArea()
            
            VStack {
                Text("My Decisions")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .fontWidth(.compressed)
                    .fontDesign(.rounded)
                    .padding(.top, 100)
                    .padding(.trailing, 100)
                    .foregroundStyle(.textcolormd)
                
                List {
                    ForEach(decisions.reversed()) { decision in
                        HStack {
                            NavigationLink(destination: DecisionView(decision: decision)) {
                                DecisionCard(card: decision)
                            }
                        }
                        .swipeActions(allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                deleteDecision(decision: decision)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                .background(Color.clear)
//                .padding(.horizontal)
//                .padding(.bottom, 60)
                ButtonCreateDecision()
                    .padding(.bottom)
                    .background(Color.clear)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(Color.background)
                    .ignoresSafeArea(edges: .bottom)
                    .padding(.top, 60)
            )
        }
    }
    
    private func deleteDecision(decision: CardModel) {
        context.delete(decision)
    }
}

#Preview {
    HaveDecisionsView()
}
