////
////  HaveDecisionsView.swift
////  MakeItGreat
////
////  Created by Joao Roberto Fernandes Magalhaes on 09/10/24.
////

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

    @State private var isAbleHaptics: Bool = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true
    let generator = UIImpactFeedbackGenerator(style: .rigid)

    @State private var pulsingStates: [CardModel: Bool] = [:]
    @State private var navigateToDetail: CardModel?
    @State private var isPulsing: Bool = false

    @State private var tappedDecision: CardModel?
    @State private var cardOffset: CGFloat = 0

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
                                
                                ZStack {
                                    DecisionCard(card: decision)
                                        .offset(y: tappedDecision == decision ? cardOffset : 0)
                                        .scaleEffect(isPulsing ? 1.05 : 1.0)
                                        .animation(.easeInOut(duration: 1.0), value: pulsingStates[decision])
                                        .rotation3DEffect(
                                            .init(degrees: convertOffsetToRotation(geometry.frame(in: .named("SCROLLVIEW")))),
                                            axis: (x: 1, y: 0, z: 0),
                                            anchor: .center,
                                            anchorZ: 1,
                                            perspective: 0.8
                                        )
                                        .swipeActions {
                                            Button {
                                                    selectedDecision = decision
                                                    alertType = .delete
                                                
                                            } label: {
                                                Label("Delete", systemImage: "trash")
                                            }
                                            .tint(.red)
                                            Button {
                                                decisionToConclude = decision
                                                alertType = .conclude
                                            } label: {
                                                Label("Conclude", systemImage: "checkmark")
                                            }
                                            .tint(.green)
                                        }
                                        .enableScrollViewSwipeAction()
                                        .onTapGesture {
                                            if isAbleHaptics {
                                                generator.impactOccurred()
                                            }
                                            pulsingStates[decision] = true
                                            tappedDecision = decision
                                            cardOffset = -10
                                            //
                                            withAnimation(.easeInOut(duration: 0.4)) {
                                                cardOffset = 0
                                            }
                                            //
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                pulsingStates[decision] = false
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    navigateToDetail = decision
                                                }
                                            }
                                        }

                                    if pulsingStates[decision] == true {
                                        DecisionCard(card: decision)
                                            .scaleEffect(1.05)
                                            .animation(.easeInOut(duration: 0.2), value: pulsingStates[decision])
                                            .onTapGesture {
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                    navigateToDetail = decision
                                                }
                                            }
                                            .zIndex(1)
                                    }
                                }
                                .shadow(color: .text.opacity(0.1), radius: 8, x: 3, y: -3)
                                .frame(height: 130)
                                .padding(.bottom, 10)

                                NavigationLink(destination: DecisionView(decision: decision), isActive: Binding<Bool>(
                                    get: { navigateToDetail == decision },
                                    set: { if !$0 { navigateToDetail = nil } }
                                )) {
                                    EmptyView()
                                }
                                .hidden()
                            }
                            .frame(height: 130)
                        }
                    }
                    .coordinateSpace(name: "SCROLLVIEW")

                    ButtonCreateDecision()
                        .frame(width: 50, height: 50)
                        .padding(.bottom,10)
//                        .background(Color.clear)
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
                            withAnimation {
                                context.delete(decision)
                                try? context.save()
                            }
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
    
    private func convertOffsetToRotation(_ rect: CGRect) -> CGFloat {
        let cardHeight = rect.height
        let minY = rect.minY
        let progress = minY < 0 ? (minY / cardHeight) : 0
        let constrainedProgress = min(-progress, 1.0)
        let rotationDegrees = constrainedProgress * 90.0
        
        return rotationDegrees
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
