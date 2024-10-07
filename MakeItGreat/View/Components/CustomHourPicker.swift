//
//  CustomHourPicker.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 06/10/24.
//

import SwiftUI

struct CustomHourPicker: View {
    @Binding var selectedHour: Date?
    @State private var isHourSelected = false

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
        //        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.primary, lineWidth: 2)
                .frame(width: 152, height: 45)
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
//            DatePicker("", selection: $selectedHour, displayedComponents: .hourAndMinute)
//                .labelsHidden()
//                .blendMode(.destinationOver)
        }
    }
}
