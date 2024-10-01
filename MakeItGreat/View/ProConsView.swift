//
//  ProConsView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI
import SwiftData

struct ProConsView: View {
    @ObservedObject var formViewModel: FormViewModel
    @ObservedObject var cardViewModel: CardViewModel

    @Query var allPros: [ProModel]   
    @Query var allCons: [ConModel]

    @Environment(\.modelContext) var context
    @State private var filteredPros: [ProModel] = []
    @State private var filteredCons: [ConModel] = []

    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                HStack(spacing: 60) {
                    VStack {
                        Text("Pros")

                        ForEach(filteredPros, id: \.self) { pro in
                            ProCard(content: pro.content)
                        }

                        Button {
                            let newPro = ProModel(id: UUID(), content: "Pro")
                            context.insert(newPro)

                            do {
                                try context.save()
                            } catch {
                                print("Erro ao salvar o contexto: \(error.localizedDescription)")
                            }
                        } label: {
                            Image(systemName: "plus")
                        }

                        Spacer()
                    }

                    VStack {
                        Text("Cons")

                        ForEach(filteredCons, id: \.self) { con in
                            ProCard(content: con.content)
                        }

                        Button {
                            let newCon = ConModel(id: UUID(), content: "")
                            context.insert(newCon)

                            do {
                                try context.save()
                            } catch {
                                print("Erro ao salvar o contexto: \(error.localizedDescription)")
                            }                        } label: {
                            Image(systemName: "plus")
                        }

                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            // Filtra os pros do card atual quando a view aparecer
            filteredPros = allPros.filter { $0.card?.id == cardViewModel.cardModel.id }
            filteredCons = allCons.filter { $0.card?.id == cardViewModel.cardModel.id }
        }
        .onChange(of: allPros) { _ in
            // Atualiza o filtro sempre que a lista de pros mudar
            filteredPros = allPros.filter { $0.card?.id == cardViewModel.cardModel.id }
        }
        .onChange(of: allCons) { _ in
            // Atualiza o filtro sempre que a lista de cons mudar
            filteredCons = allCons.filter { $0.card?.id == cardViewModel.cardModel.id }
        }
    }
}
