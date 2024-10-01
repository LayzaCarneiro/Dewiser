//
//  DecisionCard.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 28/09/24.
//

import SwiftUI
import SwiftData

struct DecisionCard: View {
    var card: CardModel

    @Query var allPros: [ProModel]
    @State private var filteredPros: [ProModel] = []

    var body: some View {
        HStack {
            Image(systemName: "person.fill")

            Text("\(card.title)")
            Text("\(card.feeling)")
            Text("\(card.priority)")
            Text("Prós: \(filteredPros.count)")
            Text("Contras: \(card.cons.count)")
        }
        .frame(width: 200, height: 200)
        .background(.cyan)
        .onAppear {
            filteredPros = allPros.filter { $0.card?.id == card.id }
        }
    }
}
