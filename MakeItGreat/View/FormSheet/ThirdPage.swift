//
//  ThirdPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct ThirdPage: View {
    @ObservedObject var formViewModel: FormViewModel

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
                    let newCard = formViewModel.cardModel
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

            ProConsView(card: formViewModel.cardModel)
        }
    }
}
