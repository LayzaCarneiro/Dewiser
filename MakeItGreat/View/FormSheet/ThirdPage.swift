//
//  ThirdPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct ThirdPage: View {
    @ObservedObject var formViewModel: FormViewModel

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
            TextField("Priority", text: $formViewModel.notes)
                .textFieldStyle(.roundedBorder)

            Text("What is the deadline")
            TextField("Deadline", text: $formViewModel.notes)
                .textFieldStyle(.roundedBorder)
        }
    }
}
