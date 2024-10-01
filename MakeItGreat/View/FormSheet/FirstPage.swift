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

    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Button {
                    formViewModel.nextPage()
                } label: {
                    Text("Next")
                }
            }

            Text("What is your decision?")
            TextField("Decision", text: $formViewModel.cardModel.title)
                .textFieldStyle(.roundedBorder)
            
            Text("Description")
            TextField("Description", text: $formViewModel.cardModel.cardDescription)
                .textFieldStyle(.roundedBorder)
            
            Text("Deadline")
            DatePicker(selection: $formViewModel.cardModel.deadline, displayedComponents: .date) {
                Text("Deadline")
            }
            
            Text("What is the priority level")
            TextField("Priority", text: $formViewModel.cardModel.priority)
                .textFieldStyle(.roundedBorder)
        }
    }
}
