//
//  FeelingItem.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 07/10/24.
//

import SwiftUI

struct FeelingItem: View {
    @State var feelTitle: String = "Sad"
    @State var feelImage: String = "sadFace"
    var selected: Bool

    var body: some View {
        VStack {
            Image(feelImage)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 47)
                .opacity(selected ? 1 : 0.3)

            Text(feelTitle)
                .font(.caption)
                .fontWeight(.medium)
                .fontDesign(.rounded)
                .padding(.top, -15)
                .foregroundStyle(.black)
        }
    }
}
