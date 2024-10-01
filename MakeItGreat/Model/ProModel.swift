//
//  ProModel.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 01/10/24.
//

import Foundation
import SwiftData

@Model
class ProModel {
    @Attribute(.unique) var id: UUID = UUID()
    var content: String
    var card: CardModel?

    init(id: UUID, content: String) {
        self.id = id
        self.content = content
//        self.card = card
    }
}
