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

                            // swiftlint:disable:next line_length
                            ProgressBar(progress: Double(filteredPros.count), total: Double(filteredPros.count + filteredCons.count), color: Color.purpleBackground)

                            Button {
                                if isAbleHaptics {
                                    generator.impactOccurred()
                                }
                                let newPro = ProModel(id: UUID(), content: "", cardID: card.id)
                                context.insert(newPro)
                            } label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Pro")
                                        .fontDesign(.rounded)
                                }
                                .frame(width: 149, height: 84, alignment: .center)
                                .background(Color.purpleBackground)
                                .cornerRadius(10)
                                .foregroundStyle(Color.textInverse)
                                .fontWeight(.bold)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.fieldStroke, lineWidth: 2)
                                )
                            }
                            .padding(.vertical, 10)
//
                            ForEach(filteredPros) { pro in
                                @Bindable var pro = pro
                                HStack {
                                    ItemCard(content: $pro.content, onDelete: {
                                       context.delete(pro)
                                        try? context.save()
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

                            // swiftlint:disable:next line_length
                            ProgressBar(progress: Double(filteredCons.count), total: Double(filteredPros.count + filteredCons.count), color: Color.yellowCustom)

                            Button {
                                if isAbleHaptics {
                                    generator.impactOccurred()
                                }
                                let newCon = ConModel(id: UUID(), content: "", cardID: card.id)
                                context.insert(newCon)
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
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.fieldStroke, lineWidth: 2)
                                )
                            }
                            .padding(.vertical, 10)

                            ForEach(filteredCons) { con in
                                @Bindable var con = con
                                HStack {
                                    ItemCard(content: $con.content, onDelete: {
                                       context.delete(con)
                                        try? context.save()
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
        .onTapGesture {
           hideKeyboard()
        }
        .onAppear {
            filteredPros = allPros.filter { $0.cardID == card.id }
            filteredCons = allCons.filter { $0.cardID == card.id }
            isAbleHaptics = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true
        }
        .onChange(of: allPros) { _, _ in
            filteredPros = allPros.filter { $0.cardID == card.id }
        }
        .onChange(of: allCons) { _, _ in
            filteredCons = allCons.filter { $0.cardID == card.id }
        }
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ProConsView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleCard = CardModel(id: UUID(), title: "Example Card")
        ProConsView(card: exampleCard)
            .modelContainer(for: [CardModel.self, ProModel.self, ConModel.self])
    }
}
