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
        ZStack {
            VStack {
                Text("My Decisions")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .fontWidth(.compressed)
                    .fontDesign(.rounded)
                    .foregroundStyle(.textcolormd)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 65)
                    .padding(.leading, 26)

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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 29)
                .padding(.bottom, 35)

                ButtonCreateDecision()
                    .frame(width: 300, height: 30)
                    .padding(.bottom, 30)
            }
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(Color.background)
                    .ignoresSafeArea(edges: .bottom)
                    .padding(.top, 33)

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
