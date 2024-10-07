//
//  ItemCard.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI
import SwiftData

struct ItemCard: View {
    @Binding var content: String
    
//    @State var deleteOn: Bool = false

    var body: some View {
        HStack(spacing: 5) {
            TextField("", text: $content)
                .frame(width: 149, height: 84)
                .background(.gray)
                .cornerRadius(10)
            
//            if deleteOn {
//                Button {
//                    content.removeAll()
//                    deleteOn = false
//                } label: {
//                    Image(systemName: "trash")
//                }
//            }
        }
//        .onLongPressGesture {
//            deleteOn = true
//        }
    }
}
