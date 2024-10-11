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
        Button {
            deleteOnForDecision.toggle()
        } label: {
            Text("Delete cards")
                .font(.title3)
                .fontWeight(.semibold)
        }

        ScrollView(.vertical, showsIndicators: false) {
            ForEach(decisions.reversed()) { decision in
                HStack {
                    NavigationLink(destination: DecisionView(decision: decision)) {
                        DecisionCard(card: decision)
                    }
                    if deleteOnForDecision {
                        Button {
                            context.delete(decision)
                        } label: {
                            Image(systemName: "trash")
                                .padding()
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
        }
    }
}

#Preview {
    HaveDecisionsView()
}
