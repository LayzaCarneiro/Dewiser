//
//  CardView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import Foundation

struct CardModel: Identifiable {
    let id = UUID()
    var title: String = ""
    var feeling: String = ""
    var priority: String = ""
    var deadline: String = ""

    var pros: [ProModel] = []
    var cons: [ConModel] = []
}
