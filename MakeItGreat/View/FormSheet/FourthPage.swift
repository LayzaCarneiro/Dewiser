//
//  FourthPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct FourthPage: View {
    @ObservedObject var formViewModel: FormViewModel
    @ObservedObject var cardViewModel: CardViewModel
    @ObservedObject var userViewModel: UserViewModel

    @Environment(\.dismiss) private var dismiss

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
                    userViewModel.addDecision()
                    dismiss()
                } label: {
                    Text("Save")
                }
            }

//            Text("Pros")
//            TextField("Pro", text: $formViewModel.notes)
//                .textFieldStyle(.roundedBorder)
//            Text("Cons")
//            TextField("Con", text: $formViewModel.notes)
//                .textFieldStyle(.roundedBorder)
            ProConsView(cardViewModel: cardViewModel)
        }
    }
}
