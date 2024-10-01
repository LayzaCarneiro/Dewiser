//
//  DecisionView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 01/10/24.
//

import SwiftUI

struct DecisionView: View {
    var decision: CardModel
    
    var body: some View {
        ProConsView(card: decision)
    }
}
