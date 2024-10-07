//
//  DecisionView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 01/10/24.
//

import SwiftUI

struct DecisionView: View {

    var decision: CardModel
    @State var sheet: Bool = false

    var body: some View {
        NavigationStack {
            ProConsView(card: decision)
        }
        .navigationTitle("\(decision.title)")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    sheet.toggle()
                } label: {
                    Text("Edit")
                }
                .sheet(isPresented: $sheet) {
                    NavigationView {
                        EditView(card: decision)
                    }
                }
            }
        }
    }
}
