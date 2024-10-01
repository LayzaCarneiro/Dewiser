//
//  ProCard.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI

struct ProCard: View {
    @State var content: String = ""

    var body: some View {
        TextField("", text: $content)
            .frame(width: 120, height: 60)
            .background(.gray)
            .cornerRadius(10)
    }
}

#Preview {
    ProCard()
}
