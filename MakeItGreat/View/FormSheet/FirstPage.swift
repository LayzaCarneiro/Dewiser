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
            TextField("Decision", text: $formViewModel.title)
                .textFieldStyle(.roundedBorder)
        }
    }
}
