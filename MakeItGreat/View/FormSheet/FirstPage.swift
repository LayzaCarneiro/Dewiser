//
//  FirstPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct FirstPage: View {
    @ObservedObject var formViewModel: FormViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var selectedPriority: Priority = .medium

    enum Priority: String, CaseIterable, Identifiable {
        case low, medium, high
        var id: Self { self }
    }

    var body: some View {
        VStack {
            Text("Decision")
                .font(.title3)
                .fontWeight(.semibold)
            TextField("What is your decision title?", text: $formViewModel.cardModel.title)
                .textFieldStyle(.roundedBorder)

            Text("Description")
                .font(.title3)
                .fontWeight(.semibold)
            TextField("What's your decision description?", text: $formViewModel.cardModel.cardDescription, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(3, reservesSpace: true)

            Text("Deadline")
                .font(.title3)
                .fontWeight(.semibold)
            DatePicker(selection: $formViewModel.cardModel.deadline, displayedComponents: .date) {
                Text("Deadline")
            }

            DatePicker("Time", selection: $formViewModel.cardModel.time, displayedComponents: .hourAndMinute)

            Text("Priority")
                .font(.title3)
                .fontWeight(.bold)
            Picker("Priority", selection: $selectedPriority) {
                ForEach(Priority.allCases) { priority in
                    Text(priority.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    formViewModel.nextPage()
                } label: {
                    Text("Next")
                }
            }
        }
    }
}
