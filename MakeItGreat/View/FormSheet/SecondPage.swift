//
//  SecondPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct SecondPage: View {
    @ObservedObject var formViewModel: FormViewModel

    var body: some View {
        VStack {
            Text("How do you feel?")
            TextField("Feeling", text: $formViewModel.cardModel.feeling)
                .textFieldStyle(.roundedBorder)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    formViewModel.previousPage()
                } label: {
                    Text("Back")
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
