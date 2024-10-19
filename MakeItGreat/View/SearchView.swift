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
                    VStack {
                        List {
                            ForEach(filteredDecisions) { decision in
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
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(PlainListStyle())
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
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
        .onTapGesture {
           hideKeyboard()
        }
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    SearchView()
}
