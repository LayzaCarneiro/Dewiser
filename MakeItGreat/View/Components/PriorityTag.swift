//
//  PriorityTag.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 09/10/24.
//

import SwiftUI

struct PriorityTag: View {

    var priority: String = "medium"
    var backgroundColor = ["low": Color.lowBackground, "medium": Color.mediumBackground, "high": Color.highBackground,  "done": Color.doneBackground]
    var foregroundColor = ["low": Color.lowForeground, "medium": Color.mediumForeground, "high": Color.highForeground, "done": Color.doneForeground]

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 52, height: 21)
                .foregroundStyle(backgroundColor[priority] ?? .blue)
                .cornerRadius(20)
            Text("\(priority.capitalized)")
                .font(.caption2)
                .fontWeight(.medium)
                .foregroundStyle(foregroundColor[priority] ?? .black)
                .multilineTextAlignment(.center)
        }
    }
}
