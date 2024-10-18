//
//  SearchView.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 01/10/24.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @State var searchTerm: String = ""
    @Query var decisions: [CardModel]

    var filteredDecisions: [CardModel] {
        if searchTerm.isEmpty {
            return decisions
        } else {
            return decisions.filter { $0.title.localizedCaseInsensitiveContains(searchTerm) }
        }
    }

    @State private var selectedDecision: CardModel?

    var body: some View {
        NavigationStack {
            if decisions.isEmpty {
                NoSearchView()
            } else {
                ZStack {
                    Color.background.ignoresSafeArea()
                    ScrollView(.vertical) {
                        ForEach(filteredDecisions) { decision in
                            Button {
                                selectedDecision = decision
                            } label: {
                                DecisionCard(card: decision)
                            }
                        }
                    }
                    .navigationDestination(isPresented: Binding(
                        get: { selectedDecision != nil },
                        set: { if !$0 { selectedDecision = nil } }
                    )) {
                        if let decision = selectedDecision {
                            DecisionView(decision: decision)
                        }
                    }
                }
                //
                .searchable(text: $searchTerm, placement: .navigationBarDrawer(
                    displayMode: .always),
                            prompt: "Search your decision cards"
                )
                var filterDecisions: [CardModel] {
                    if searchTerm.isEmpty {
                        return decisions
                    }
                    return decisions.filter {
                        $0.title.localizedCaseInsensitiveContains(searchTerm) ||
                        (($0.cardDescription?.localizedCaseInsensitiveContains(searchTerm)) != nil)
                    }
                }
            }
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    SearchView()
}
