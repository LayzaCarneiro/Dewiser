//
//  DecisionCard.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 28/09/24.
//

import SwiftUI

struct DecisionCard: View {
    var body: some View {

        HStack {
            Image(systemName: "person.fill")

            Text("Decision")
        }
        .frame(width: 120, height: 60)
        .background(.cyan)

    }
}

#Preview {
    DecisionCard()
}
