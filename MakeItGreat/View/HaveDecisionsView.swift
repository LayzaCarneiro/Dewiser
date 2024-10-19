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
    @State private var deleteOnForDecision: Bool = false
    @State private var selectedDecision: CardModel?
  
    @Query var decisions: [CardModel]
    @Environment(\.modelContext) var context

    let generator = UIImpactFeedbackGenerator(style: .rigid)
    
    private var isHapticsEnabled: Bool {
        UserDefaults.standard.bool(forKey: "isAbleHaptics")
    }

    enum AlertType: Identifiable {
        case delete, conclude
        
        var id: Int {
            hashValue 
        }
    }

    @State private var alertType: AlertType?
    @State private var decisionToDelete: CardModel?
    @State private var decisionToConclude: CardModel?

    @Environment(\.modelContext) var context
    @Query var decisions: [CardModel]

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
                            // swiftlint:disable:next line_length
                            priorityOrder(CardModel.Priority(rawValue: $0.priority) ?? .medium) > priorityOrder(CardModel.Priority(rawValue: $1.priority) ?? .medium)})) { decision in
                                HStack {
                                    Button {
                                        selectedDecision = decision
                                    } label: {
                                        DecisionCard(card: decision)
                                    }
                                    .background(
                                        NavigationLink(destination: DecisionView(decision: decision)) {
                                            EmptyView()
                                       }
                                        .opacity(0.0)
                                        .frame(width: 0, height: 0)
                                    )
                                }
                            .swipeActions(allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    // Gera feedback tátil apenas se haptics estiver habilitado
                                    if isHapticsEnabled {
                                        generator.impactOccurred()
                                    }
                                    decisionToDelete = decision
                                    alertType = .delete
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                .tint(.red)

                                if decision.priority != "done" {
                                    Button(role: .none) {
                                        if isHapticsEnabled {
                                            generator.impactOccurred()
                                        }
                                        decisionToConclude = decision
                                        alertType = .conclude
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
                        .background(Color.clear)
                }
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color.background)
                        .ignoresSafeArea(edges: .bottom)
                        .padding(.top, 33)
                )
            }
        }
        .alert(item: $alertType) { type in
            switch type {
            case .delete:
                return Alert(
                    title: Text("Delete Decision"),
                    message: Text("Are you sure you want to delete this decision? This action cannot be undone."),
                    primaryButton: .destructive(Text("Delete")) {
                        if let decision = decisionToDelete {
                            deleteDecision(decision: decision)
                        }
                    },
                    secondaryButton: .cancel()
                )
            case .conclude:
                return Alert(
                    title: Text("Congratulations!"),
                    message: Text("Hope you made a wise decision! Are you sure of that?"),
                    primaryButton: .default(Text("Conclude")) {
                        if let decision = decisionToConclude {
                            decision.priority = "done"
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }

    private func deleteDecision(decision: CardModel) {
        context.delete(decision)
        try? context.save()
    }

    private func priorityOrder(_ priority: CardModel.Priority) -> Int {
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
