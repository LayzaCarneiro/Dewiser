//
//  ProConsView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI
import SwiftData

struct ProConsView: View {
    var card: CardModel

    @Query var allPros: [ProModel]
    @Query var allCons: [ConModel]

    @Environment(\.modelContext) var context
    @State private var filteredPros: [ProModel] = []
    @State private var filteredCons: [ConModel] = []

    @State var deleteOn: Bool = false
    
    @State private var deleteOnForDecision: Bool = false

    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    Button {
                        deleteOnForDecision.toggle()
                    } label: {
                        Text("Delete item")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
                    HStack(spacing: 20) {
                        VStack {
                            Text("Pros")
                                .font(.title2)
                                .fontDesign(.rounded)
                                .fontWeight(.bold)
                            
                            ProgressBar(progress: Double(filteredPros.count), total: Double(filteredPros.count + filteredCons.count))
                            
                            Button {
                                let newPro = ProModel(id: UUID(), content: "Pro", cardID: card.id)
                                context.insert(newPro)
                            } label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Pro")
                                }
                                .frame(width: 149, height: 84, alignment: .center)
                                .background(.blue)
                                .cornerRadius(10)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                
                            }
                            
                            ForEach($filteredPros, id: \.self) { $pro in
                                HStack {
                                    ItemCard(content: $pro.content)
                                    
                                    if deleteOnForDecision {
                                        Button {
                                            context.delete(pro)
                                        } label: {
                                            Image(systemName: "trash")
                                                .padding()
                                        }
                                        .buttonStyle(BorderlessButtonStyle())
                                    }
                                }
                            }
                            Spacer()
                        }
                        
                        VStack {
                            Text("Cons")
                                .font(.title2)
                                .fontDesign(.rounded)
                                .fontWeight(.bold)
                            
                            ProgressBar(progress: Double(filteredCons.count), total: Double(filteredPros.count + filteredCons.count))
                            
                            Button {
                                let newCon = ConModel(id: UUID(), content: "Con", cardID: card.id)
                                context.insert(newCon)
                            } label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Con")
                                }
                                .frame(width: 149, height: 84, alignment: .center)
                                .background(.blue)
                                .cornerRadius(10)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                            }
                            
                            ForEach($filteredCons, id: \.self) { $con in
                                HStack {
                                    ItemCard(content: $con.content)
                                    
                                    if deleteOnForDecision {
                                        Button {
                                            context.delete(con)
                                        } label: {
                                            Image(systemName: "trash")
                                                .padding()
                                        }
                                        .buttonStyle(BorderlessButtonStyle())
                                    }
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

