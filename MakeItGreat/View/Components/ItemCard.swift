//
//  ItemCard.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI
import SwiftData

struct ItemCard: View {
    @Binding var content: String
    var onDelete: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
            TextField("", text: $content)
                .frame(width: 149, height: 84)
                .background(Color.cardBackground)
                .cornerRadius(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.strokecard, lineWidth: 4)
                        .frame(width: 149, height: 84)
                )
            Button {
                onDelete()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.strokecard)
                    .padding(6)
            }
        }
        .frame(width: 149, height: 84)
    }
}
