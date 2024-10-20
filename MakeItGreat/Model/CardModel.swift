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
    var cardDescription: String?
    var feeling: String
    var priority: String
    var deadline: Date?
    var time: Date?

    var priorityEnum: Priority {
        get {
            return Priority(rawValue: priority) ?? .medium
        }
        set {
            priority = newValue.rawValue
        }
    }
    // swiftlint:disable:next line_length
    init(id: UUID = UUID(), title: String = "", cardDescription: String? = nil, feeling: String = "Confident", priorityEnum: Priority = .medium, deadline: Date? = nil, time: Date? = nil) {
        self.id = id
        self.title = title
        self.cardDescription = cardDescription
        self.feeling = feeling
        self.priority = priorityEnum.rawValue
        self.deadline = deadline
        self.time = time
    }
}

extension CardModel {
    enum Priority: String, CaseIterable, Identifiable {
        case low, medium, high, done
        var id: Self { self }
    }
}
