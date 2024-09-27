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
    
}
