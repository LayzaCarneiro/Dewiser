//
//  SecondPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct SecondPage: View {
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

            Text("How do you feel?")
            TextField("Feeling", text: $formViewModel.cardViewModel.cardModel.feeling)
                .textFieldStyle(.roundedBorder)
        }
    }
}
