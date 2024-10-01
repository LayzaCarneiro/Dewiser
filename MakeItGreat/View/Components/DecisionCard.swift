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
    
    @Query var allCons: [ConModel]
    @State private var filteredCons: [ConModel] = []

    var body: some View {
        HStack {
            Image(systemName: "person.fill")

            Text("\(card.title)")
                .font(.title)
            Text("\(card.feeling)")
            Text("\(card.priority)")
            Text("Prós: \(filteredPros.count)")
            Text("Contras: \(filteredCons.count)")
        }
        .frame(width: 336, height: 117)
        .background(.cyan)
        .onAppear {
            filteredPros = allPros.filter { $0.cardID == card.id }
            filteredCons = allCons.filter { $0.cardID == card.id }
        }
    }
}
