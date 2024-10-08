//
//  CustomHourPicker.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 06/10/24.
//

import SwiftUI

struct CustomHourPicker: View {
    @Binding var selectedHour: Date?
    @State var isHourSelected: Bool

    var body: some View {

        HStack(spacing: 45) {
            if let hour = selectedHour, isHourSelected {
                Text(hour.toString("HH:mm"))
            } else {
                Text("--:--")
                    .foregroundColor(.gray)
            }

            Image(systemName: "clock")
                .resizable()
                .frame(width: 21, height: 21)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .frame(width: 152, height: 45)
        .background(.backgroundField)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.stroke, lineWidth: 2)
        )
        .overlay {
            DatePicker("", selection: Binding(get: {
                            selectedHour ?? Date() 
                        }, set: { newValue in
                            selectedHour = newValue
                            isHourSelected = true
                        }), displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .blendMode(.destinationOver)
        }
    }
}
