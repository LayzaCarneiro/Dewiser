//
//  ProConsView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI
import SwiftData

struct ProConsView: View {
//    @ObservedObject var formViewModel = FormViewModel()
    var card: CardModel
    
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
                        ProgressBar()

                        ForEach(filteredPros, id: \.self) { pro in
                            ProCard(content: pro.content)
                        }
                        
                        Button {
                            let newPro = ProModel(id: UUID(), content: "Pro", cardID: card.id)
                            context.insert(newPro)
                        } label: {
                            Image(systemName: "plus")
                        }

                        Spacer()
                    }

                    VStack {
                        Text("Cons")
                        ProgressBar(progress: Double(filteredPros.count), total: Double(filteredPros.count + filteredCons.count))
                        
                        ForEach(filteredCons, id: \.self) { con in
                            ProCard(content: con.content)
                        }
                        
                        Button {
                            let newCon = ConModel(id: UUID(), content: "Con", cardID: card.id)
                            context.insert(newCon)
                        } label: {
                            Image(systemName: "plus")
                        }

                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            filteredPros = allPros.filter { $0.cardID == card.id }
            filteredCons = allCons.filter { $0.cardID == card.id }
        }
        .onChange(of: allPros) { _ in
            filteredPros = allPros.filter { $0.cardID == card.id }
        }
        .onChange(of: allCons) { _ in
            filteredCons = allCons.filter { $0.cardID == card.id }
        }
    }
}
