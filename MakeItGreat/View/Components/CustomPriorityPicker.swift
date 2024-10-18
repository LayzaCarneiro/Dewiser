//
//  CustomPriorityPicker.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 06/10/24.
//

import SwiftUI

struct CustomPriorityPicker: View {
    @Binding var selectedPriority: CardModel.Priority

    var body: some View {
        Picker("Priority", selection: $selectedPriority) {
            ForEach(CardModel.Priority.allCases.filter {$0 != .done}) { priority in
                Text(priority.rawValue.capitalized)
            }
        }
        .pickerStyle(.segmented)
        .colorMultiply(colorForPriority(selectedPriority))
        .background(.textInverse)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 8.91)
                .stroke(Color.fieldStroke, lineWidth: 2)
        )
    }

    func colorForPriority(_ priority: CardModel.Priority) -> Color {
        switch priority {
        case .low: return Color.bluePicker
        case .medium: return Color.yellowPicker
        case .high: return Color.redPicker
        case .done: return Color.redPicker
        }
    }
}
