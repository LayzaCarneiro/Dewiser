//
//  CardViewModel.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import Foundation

class CardViewModel: ObservableObject {

    @Published var cardModel = CardModel()

    func addPro(content: String) {
        cardModel.pros.append(ProModel(content: content))
    }

    func addCon(content: String) {
        cardModel.cons.append(ConModel(content: content))
    }

    func consPercentage() -> Double {
        var percentage: Double

        if(cardModel.pros.count > 0 || cardModel.cons.count > 0) {
            percentage = Double(cardModel.cons.count * 100 / (cardModel.pros.count + cardModel.cons.count))
        } else {
            percentage = 50
        }

        return percentage
    }

    func prosPercentage() -> Double {
        var percentage: Double

        if(cardModel.pros.count > 0 || cardModel.cons.count > 0) {
            percentage = Double(cardModel.pros.count * 100 / (cardModel.pros.count + cardModel.cons.count))
        } else {
            percentage = 50
        }

        return percentage
    }

}
