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
                .padding(.horizontal)
                .padding(.bottom, 60)
                ButtonCreateDecision()
                    .padding(.bottom)
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
}

#Preview {
    HaveDecisionsView()
}
