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
    @State private var selectedDecision: CardModel?

    var body: some View {
        NavigationStack {

            ZStack {
                VStack {
                    Text("My Decisions")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .fontWidth(.compressed)
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 65)
                        .padding(.leading, 26)

                    List {
                        ForEach(decisions.sorted(by: {
                            priorityOrder(Priority(rawValue: $0.priority) ?? .medium) > priorityOrder(Priority(rawValue: $1.priority) ?? .medium)})) { decision in
                            HStack {
                                Button {
                                    selectedDecision = decision
                                } label: {
                                    DecisionCard(card: decision)
                                }
                            }
                            .swipeActions(allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    deleteDecision(decision: decision)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                if decision.priority != "done" {
                                    Button(role: .none) {
                                        decision.priority = "done"
                                    } label: {
                                        Label("Conclude", systemImage: "checkmark")
                                    }
                                    .tint(.green)
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
                    .padding(.leading, 10)
                    .padding(.bottom, 35)

                    ButtonCreateDecision()
                        .frame(width: 300, height: 20)
                        .padding(.bottom, 30)
                }
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color.background)
                        .ignoresSafeArea(edges: .bottom)
                        .padding(.top, 33)

                )
                .navigationDestination(isPresented: Binding(
                    get: { selectedDecision != nil },
                    set: { if !$0 { selectedDecision = nil } }
                )) {
                    if let decision = selectedDecision {
                        DecisionView(decision: decision)
                    }
                }
            }
        }
    }

    private func deleteDecision(decision: CardModel) {
        context.delete(decision)
    }
    
    private func priorityOrder(_ priority: Priority) -> Int {
        switch priority {
        case .high:
            return 3
        case .medium:
            return 2
        case .low:
            return 1
        case .done:
            return 0
        }
    }
}

#Preview {
    HaveDecisionsView()
}
