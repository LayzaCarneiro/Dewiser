//
//  ProConsView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI
import SwiftData
import UIKit

struct ProConsView: View {
    var card: CardModel

    @Query var allPros: [ProModel]
    @Query var allCons: [ConModel]

    @Environment(\.modelContext) var context
    @State private var filteredPros: [ProModel] = []
    @State private var filteredCons: [ConModel] = []
    @State var deleteOn: Bool = false
    @State private var deleteOnForDecision: Bool = false
    let generator = UIImpactFeedbackGenerator(style: .rigid)
    @State private var isAbleHaptics: Bool = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true

    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack(spacing: 20) {
                        VStack {
                            Text("Pros")
                                .font(.system(size: 32))
                                .fontDesign(.rounded)
                                .fontWidth(.compressed)
                                .fontWeight(.black)

                            ProgressBar(progress: Double(filteredPros.count), total: Double(filteredPros.count + filteredCons.count), color: Color.purpleBackground)

                            Button {
                                if isAbleHaptics {
                                    generator.impactOccurred()
                                }
                                let newPro = ProModel(id: UUID(), content: "", cardID: card.id)
                                context.insert(newPro)
                                updateFilteredLists()
                            } label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Pro")
                                        .fontDesign(.rounded)
                                }
                                .frame(width: 149, height: 84, alignment: .center)
                                .background(Color.purpleBackground)
                                .cornerRadius(10)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                            }
                            .padding(.vertical, 10)

                            ForEach(filteredPros, id: \.id) { pro in
                                HStack {
                                    ItemCard(content: Binding(
                                        get: { pro.content },
                                        set: { newValue in
                                            pro.content = newValue
                                            try? context.save()
                                        }
                                    ), onDelete: {
                                        context.delete(pro)
                                        updateFilteredLists()
                                    })
                                    .padding(.bottom, 10)
                                }
                            }
                            Spacer()
                        }

                        VStack {
                            Text("Cons")
                                .font(.system(size: 32))
                                .fontDesign(.rounded)
                                .fontWidth(.compressed)
                                .fontWeight(.black)

                            ProgressBar(progress: Double(filteredCons.count), total: Double(filteredPros.count + filteredCons.count), color: Color.yellowCustom)

                            Button {
                                if isAbleHaptics {
                                    generator.impactOccurred()
                                }
                                let newCon = ConModel(id: UUID(), content: "", cardID: card.id)
                                context.insert(newCon)
                                updateFilteredLists()
                            } label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Con")
                                        .foregroundStyle(.black)
                                        .fontDesign(.rounded)
                                }
                                .frame(width: 149, height: 84, alignment: .center)
                                .background(Color.yellowCustom)
                                .cornerRadius(10)
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                            }
                            .padding(.vertical, 10)

                            ForEach(filteredCons, id: \.id) { con in
                                HStack {
                                    ItemCard(content: Binding(
                                        get: { con.content },
                                        set: { newValue in
                                            con.content = newValue
                                            try? context.save()
                                        }
                                    ), onDelete: {
                                        context.delete(con)
                                        updateFilteredLists()
                                    })
                                    .padding(.bottom, 10)
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .onAppear {
            updateFilteredLists()
            
            isAbleHaptics = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true
        }
        .onChange(of: allPros) { _ in
            updateFilteredLists()
        }
        .onChange(of: allCons) { _ in
            updateFilteredLists()
        }
    }

    // Função para atualizar as listas filtradas
    func updateFilteredLists() {
        filteredPros = allPros.filter { $0.cardID == card.id }
        filteredCons = allCons.filter { $0.cardID == card.id }
    }
}
struct ProConsView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleCard = CardModel(id: UUID(), title: "Example Card")
        ProConsView(card: exampleCard)
            .modelContainer(for: [CardModel.self, ProModel.self, ConModel.self])
    }
}
