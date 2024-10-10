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

    var body: some View {
        ZStack {
            Color.colorbackground.ignoresSafeArea()
            ScrollView(.vertical) {
                VStack {
                    HStack(spacing: 20) {
                        VStack {
                            Text("Pros")
                                .font(.system(size: 32))
                                .fontDesign(.rounded)
                                .fontWidth(.compressed)
                                .fontWeight(.black)
                            ProgressBar(progress: Double(filteredPros.count), total: Double(filteredPros.count + filteredCons.count), color: .procard)
                            Button {
                                generator.impactOccurred()
                                let newPro = ProModel(id: UUID(), content: "Pro", cardID: card.id)
                                context.insert(newPro)
                            } label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Pro")
                                        .fontDesign(.rounded)
                                }
                                .frame(width: 149, height: 84, alignment: .center)
                                .background(.procard)
                                .cornerRadius(10)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                            }
                            ForEach($filteredPros, id: \.self) { $pro in
                                HStack {
                                    ItemCard(content: $pro.content, onDelete: {
                                           context.delete(pro)
                                       })
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
                            ProgressBar(progress: Double(filteredCons.count), total: Double(filteredPros.count + filteredCons.count), color: .buttoncolor)
                            Button {
                                generator.impactOccurred()
                                let newCon = ConModel(id: UUID(), content: "Con", cardID: card.id)
                                context.insert(newCon)
                            } label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Con")
                                        .foregroundStyle(.black)
                                        .fontDesign(.rounded)
                                }
                                .frame(width: 149, height: 84, alignment: .center)
                                .background(.buttoncolor)
                                .cornerRadius(10)
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                            }
                            ForEach($filteredCons, id: \.self) { $con in
                                HStack {
                                    ItemCard(content: $con.content, onDelete: {
                                           context.delete(con)
                                       })
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .onAppear {
            filteredPros = allPros.filter { $0.cardID == card.id }
            filteredCons = allCons.filter { $0.cardID == card.id }
        }
        .onChange(of: allPros) {
            filteredPros = allPros.filter { $0.cardID == card.id }
        }
        .onChange(of: allCons) {
            filteredCons = allCons.filter { $0.cardID == card.id }
        }
    }
}
struct ProConsView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleCard = CardModel(id: UUID(), title: "Example Card")
        ProConsView(card: exampleCard)
            .modelContainer(for: [CardModel.self, ProModel.self, ConModel.self])
    }
}
