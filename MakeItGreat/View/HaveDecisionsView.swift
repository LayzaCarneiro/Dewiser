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
    @State private var alertType: AlertType?
    @State private var decisionToConclude: CardModel?

    @Query var decisions: [CardModel]
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("My Decisions")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .fontWidth(.compressed)
                        .fontDesign(.rounded)
                        .foregroundStyle(.textTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 65)
                        .padding(.leading, 26)

                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(decisions.sorted(by: {
                            priorityOrder(CardModel.Priority(rawValue: $0.priority) ?? .medium) > priorityOrder(CardModel.Priority(rawValue: $1.priority) ?? .medium)
                        })) { decision in
                            GeometryReader { geometry in
                                let minY = geometry.frame(in: .named("SCROLLVIEW")).minY

                                NavigationLink(destination: DecisionView(decision: decision)) {
                                    DecisionCard(card: decision)
                                        .rotation3DEffect(
                                            .init(degrees: convertOffsetToRotation(geometry.frame(in: .named("SCROLLVIEW")))),
                                            axis: (x: 1, y: 0, z: 0),
                                            anchor: .center,
                                            anchorZ: 1,
                                            perspective: 1
                                        )
                                        .swipeActions {
                                            Button(role: .destructive) {
                                                selectedDecision = decision
                                                alertType = .delete
                                            } label: {
                                                Label("Delete", systemImage: "trash")
                                            }
                                            Button {
                                                decisionToConclude = decision
                                                alertType = .conclude
                                            } label: {
                                                Label("Conclude", systemImage: "checkmark")
                                            }
                                            .tint(.green)
                                        }
                                        .enableScrollViewSwipeAction()
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(height: 130)
                                .padding(.bottom, 10)
                            }
                            .frame(height: 130)
                        }
                    }
                    .coordinateSpace(name: "SCROLLVIEW")

                    ButtonCreateDecision()
                        .frame(width: 300, height: 70)
                        .padding(.top, 8)
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
                        if let decision = selectedDecision {
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
                            concludeDecision(decision: decision)
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

    private func concludeDecision(decision: CardModel) {
        decision.priority = "done"
        try? context.save()
    }

    private func convertOffsetToRotation(_ rect: CGRect) -> CGFloat {
        let cardHeight = rect.height
        let minY = rect.minY - 20
        let progress = minY < 0 ? (minY / cardHeight) : 0
        let constrainedProgress = min(-progress, 1.0)
        return constrainedProgress * 90.0
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

    enum AlertType: Identifiable {
        case delete, conclude

        var id: Int {
            hashValue
        }
    }
}

#Preview {
    HaveDecisionsView()
}
