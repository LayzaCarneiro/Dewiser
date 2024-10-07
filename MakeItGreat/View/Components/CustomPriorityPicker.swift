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
        .colorMultiply(.orange)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.primary, lineWidth: 2)
        )
    }
}
