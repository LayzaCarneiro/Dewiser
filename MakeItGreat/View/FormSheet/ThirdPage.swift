//
//  ThirdPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct ThirdPage: View {
    @ObservedObject var formViewModel: FormViewModel
    @ObservedObject var cardViewModel: CardViewModel

    var body: some View {
        VStack {
            HStack {
                Button {
                    formViewModel.previousPage()
                } label: {
                    Text("Back")
                }
                Spacer()
                Button {
                    formViewModel.nextPage()
                } label: {
                    Text("Next")
                }
            }

            Text("What is the priority level")
            TextField("Priority", text: $formViewModel.cardViewModel.cardModel.priority)
                .textFieldStyle(.roundedBorder)

            Text("What is the deadline")
            DatePicker(selection: $formViewModel.cardViewModel.cardModel.deadline, displayedComponents: .date) {
                Text("Deadline")
            }
        }
    }
}
