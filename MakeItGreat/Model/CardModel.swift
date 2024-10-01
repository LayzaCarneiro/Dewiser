//
//  CardView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import Foundation
import SwiftData

@Model
class CardModel: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()

    var title: String
    var feeling: String
    var priority: String
    var deadline: Date

    init(id: UUID = UUID(), title: String = "", feeling: String = "", priority: String = "", deadline: Date = Date.now) {
        self.id = id
        self.title = title
        self.feeling = feeling
        self.priority = priority
        self.deadline = deadline
    }
}
