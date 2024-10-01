//
//  SearchView.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 01/10/24.
//
import SwiftUI
import  SwiftData

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
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical) {
                    ForEach(filteredDecisions) { decision in
                        DecisionCard(card: decision)
                    }
                }
            }
            .searchable(text: $searchTerm, placement: .navigationBarDrawer(
                displayMode: .always),
                        prompt: "Search your decision cards"
            )
        }
    }
}
#Preview {
    SearchView()
}
