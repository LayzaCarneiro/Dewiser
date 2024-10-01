////
////  CardViewModel.swift
////  MakeItGreat
////
////  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
////
//
//import Foundation
//import SwiftUI
//import SwiftData
//
//class CardViewModel: ObservableObject {
//    @Published var cardModel: CardModel
//    @Environment(\.modelContext) var context
//
//    init(cardModel: CardModel = CardModel()) {
//        self.cardModel = cardModel
//    }
//
////    func addPro(content: String, context: ModelContext) {
////        cardModel.pros.append(content)
////
////        do {
////            try context.save() // Salva as mudanças no contexto
////        } catch {
////            print("Erro ao adicionar o ProModel: \(error.localizedDescription)")
////        }
////    }
////
////    func addCon(content: String, context: ModelContext) {
////        cardModel.cons.append(content)
////
////        do {
////            try context.save() // Salva as mudanças no contexto
////        } catch {
////            print("Erro ao adicionar o ProModel: \(error.localizedDescription)")
////        }
////    }
//
////    func consPercentage() -> Double {
////        let total = cardModel.pros.count + cardModel.cons.count
////        return total > 0 ? Double(cardModel.cons.count * 100 / total) : 50
////    }
////
////    func prosPercentage() -> Double {
////        let total = cardModel.pros.count + cardModel.cons.count
////        return total > 0 ? Double(cardModel.pros.count * 100 / total) : 50
////    }
//}
