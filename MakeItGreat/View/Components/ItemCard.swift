//
//  ItemCard.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI
import SwiftData
import Combine

struct ItemCard: View {
    @Binding var content: String
    let textLimit = 25
    var onDelete: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
            if content.isEmpty {
               Text("Add reason")
                   .foregroundColor(.gray)
                   .padding(15)
                   .frame(width: 149, height: 84, alignment: .leading)
           }

            TextEditor(text: $content)
                .onReceive(Just(content)) { _ in limitText(textLimit) }
                .padding(10)
                .frame(width: 149, height: 84)
                .background(Color.cardBackground)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.strokecard, lineWidth: 4)
                )
                .lineLimit(nil)
                .opacity(content.isEmpty ? 0.25 : 1)

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

    func limitText(_ upper: Int) {
        if content.count > upper {
            let index = content.index(content.startIndex, offsetBy: upper)
            content = String(content[..<index])
        }
    }
}
