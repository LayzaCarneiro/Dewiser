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
            ProConsView(card: formViewModel.cardModel)
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
        }
    }
}
