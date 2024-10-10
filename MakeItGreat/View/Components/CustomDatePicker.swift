//
//  DatePicker.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 06/10/24.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var selectedDate: Date?
    @State var isDateSelected: Bool

    var body: some View {
        HStack(spacing: 43) {
            if let date = selectedDate, isDateSelected {
                Text(date.toString("MMM dd"))
            } else {
                Text("Pick a date")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }

            Image(systemName: "calendar")
                .resizable()
                .frame(width: 21, height: 21, alignment: .center)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(.itemcardcolor)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.primary, lineWidth: 2)
                .frame(width: 152, height: 45)
        )
        .overlay {
            DatePicker(
                "",
                selection: Binding(get: { selectedDate ?? Date() },
                                    set: { newValue in
                                        selectedDate = newValue
                                        isDateSelected = true }),
                                    displayedComponents: .date)
//            DatePicker(
//                "",
//                selection: $selectedDate,
//                displayedComponents: .date

            .labelsHidden()
            .blendMode(.destinationOver)
        }

    }
}

extension Date {
    func toString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
