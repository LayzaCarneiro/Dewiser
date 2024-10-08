//
//  CustomPriorityPicker.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 06/10/24.
//

import SwiftUI

struct CustomPriorityPicker: View {
    @Binding var selectedPriority: Priority

    var body: some View {
        Picker("Priority", selection: $selectedPriority) {
            ForEach(Priority.allCases) { priority in
                Text(priority.rawValue.capitalized)
            }
        }
        .pickerStyle(.segmented)
        .colorMultiply(colorForPriority(selectedPriority).opacity(0.8))
        .background(.backgroundField)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 8.91)
                .stroke(.stroke, lineWidth: 2)
        )
    }

    func colorForPriority(_ priority: Priority) -> Color {
        switch priority {
        case .low: return .blue
        case .medium: return .yellow
        case .high: return .red
        }
    }
}
