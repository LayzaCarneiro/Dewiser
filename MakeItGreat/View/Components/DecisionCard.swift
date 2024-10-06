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
    @Query var allCons: [ConModel]
    @State private var filteredPros: [ProModel] = []
    @State private var filteredCons: [ConModel] = []

    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .foregroundStyle(.white)

            Text("\(card.title)")
                .font(.title)
                .foregroundStyle(.white)

            Text("\(card.feeling)")
                .foregroundStyle(.white)

            Text("\(card.priority)")
                .foregroundStyle(.white)

            Text("Pros: \(filteredPros.count)")
                .foregroundStyle(.white)

            Text("Cons: \(filteredCons.count)")
                .foregroundStyle(.white)

        }
        .frame(width: 336, height: 117)
        .background(.primary)
        .cornerRadius(10)
        .onAppear {
            filteredPros = allPros.filter { $0.cardID == card.id }
            filteredCons = allCons.filter { $0.cardID == card.id }
        }
    }
}
