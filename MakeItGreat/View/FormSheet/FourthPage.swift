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

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context

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
                // swiftlint:disable line_length
                    let newCard = CardModel(title: formViewModel.cardViewModel.cardModel.title, feeling: formViewModel.cardViewModel.cardModel.feeling, priority: formViewModel.cardViewModel.cardModel.priority, deadline: formViewModel.cardViewModel.cardModel.deadline)
                    context.insert(newCard)

                    do {
                        try context.save()
                    } catch {
                        print("Erro ao salvar o contexto: \(error.localizedDescription)")
                    }

                    dismiss()
                } label: {
                    Text("Save")
                }
            }

            ProConsView(formViewModel: formViewModel, cardViewModel: cardViewModel)
        }
    }
}
