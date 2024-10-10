//
//  NoSearchView.swift
//  MakeItGreat
//
//  Created by Melissa Freire Guedes on 10/10/24.
//

import SwiftUI
import  SwiftData

struct NoSearchView: View {
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
            ZStack(alignment: .bottom) {
                Color.clear // Preenche o fundo para garantir que a área ocupe toda a tela
                Image("nodecisions")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: .infinity, alignment: .bottom) // Alinha a imagem no fundo
                    .ignoresSafeArea()
                VStack {
                    ContentUnavailableView {
                        Spacer()
                        Label("""
You don't have any 
decisions yet
""", systemImage: "")
                        .font(.system(size: 30, weight: .heavy))
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .padding(.bottom, 95)
                    }
                }
            }
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
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    NoSearchView()
}

