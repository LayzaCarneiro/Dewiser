//
//  ButtonCreateDecision.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 09/10/24.
//

import SwiftUI
import SwiftData

struct ButtonCreateDecision: View {
    @State private var isPresented: Bool = false

    @Query var decisions: [CardModel]

    @State private var deleteOnForDecision: Bool = false

    @Environment(\.modelContext) var context

    var body: some View {
        Button {
                            isPresented.toggle()
                        } label: {
                            Text("Create a decision")
                                .font(.title2)
                                .fontWeight(.black)
                                .fontDesign(.rounded)
                                .foregroundColor(.black)
                                .frame(width: 254, height: 76)
                                .background(.yellowCustom)
                                .cornerRadius(30)
                        }
                        .fullScreenCover(isPresented: $isPresented) {
                            NavigationView {
                                FirstPage(formViewModel: FormViewModel(), isPresented: $isPresented)
                            }
                        }
                    }
    }

#Preview {
    ButtonCreateDecision()
}
