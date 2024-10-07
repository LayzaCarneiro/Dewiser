//
//  ThirdPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct ThirdPage: View {
    @ObservedObject var formViewModel: FormViewModel
    @Binding var isPresented: Bool
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                ProConsView(card: formViewModel.cardModel)
            }
            
        }
        .navigationTitle("New Decision")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    let newCard = formViewModel.cardModel
                    context.insert(newCard)
                    
                    do {
                        try context.save()
                    } catch {
                        print("Erro ao salvar o contexto: \(error.localizedDescription)")
                    }
                    isPresented.toggle()
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}
