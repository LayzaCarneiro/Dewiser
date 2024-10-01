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
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical) {
                    ForEach(decisions) { decision in
                        DecisionCard(card: decision)
                    }
                }
            }.navigationTitle("Search")
        }.searchable(text: $searchTerm, prompt: "Search your decision cards")
    }
}
#Preview {
    SearchView()
}
