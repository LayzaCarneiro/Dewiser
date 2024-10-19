//
//  FeelingItem.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 07/10/24.
//

import SwiftUI

struct FeelingItem: View {
    @State var feelTitle: String = "Confident"
    @State var feelImage: String = "confidentFace"
    var selected: Bool

    var body: some View {
        VStack {
            Image(feelImage)
                .resizable()
                .scaledToFit()
                .frame(width: 51, height: 47)
                .opacity(selected ? 1 : 0.3)

            Text(feelTitle.capitalized)
                .font(.caption)
                .fontWeight(.medium)
                .fontDesign(.rounded)
                .foregroundStyle(.text)
        }
    }
}
