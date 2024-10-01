//
//  ConModel.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 01/10/24.
//

import Foundation
import SwiftData

@Model
class ConModel {
    @Attribute(.unique) var id: UUID = UUID()
    var content: String
    var cardID: UUID = UUID()

    init(id: UUID, content: String, cardID: UUID) {
        self.id = id
        self.content = content
        self.cardID = cardID
    }
}
