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
    
    var images = ["Insecure": "insecureFace", "Angry": "angryFace", "Ok": "okFace", "Good": "goodFace", "Confident": "confidentFace"]

    var body: some View {
        ZStack(alignment: .leading) {
            HStack(spacing: 8) {
                Image(images[card.feeling] ?? "goodFace")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)

                VStack(alignment: .leading, spacing: 10) {
                    Text("\(card.title.capitalized)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.text)

                    Text("\(card.cardDescription ?? "")")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(.text)
                        .lineLimit(2, reservesSpace: true)
                        .multilineTextAlignment(.leading)

                    PriorityTag(priority: card.priority)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(.trailing, 27)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
            .padding(.vertical)
        }
        .frame(width: 341, height: 124)
        .background(Color.cardBackground)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .inset(by: 1)
                .stroke(Color.cardStroke, lineWidth: 2)
        )
        .onAppear {
            filteredPros = allPros.filter { $0.cardID == card.id }
            filteredCons = allCons.filter { $0.cardID == card.id }
        }
    }
}
