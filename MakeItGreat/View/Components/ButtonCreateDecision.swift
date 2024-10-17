//
//  ButtonCreateDecision.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 09/10/24.
//

import SwiftUI
import SwiftData

struct ButtonCreateDecision: View {
    @Environment(\.modelContext) var context
    @State private var isPresented: Bool = false
    @State private var deleteOnForDecision: Bool = false

    @Query var decisions: [CardModel]

    var body: some View {
        ZStack {
            Button {
                isPresented.toggle()
            } label: {
                Text("Create a decision")
                    .font(.title2)
                    .fontWeight(.black)
                    .fontDesign(.rounded)
                    .foregroundColor(.textCreateButton)
                    .frame(width: 254, height: 70)
                    .background(.yellowCustom)
                    .cornerRadius(30)
            }
            .buttonStyle(CustomButton(colorButton: .yellowCustom))
            .fullScreenCover(isPresented: $isPresented) {
                NavigationView {
                    FirstPage(formViewModel: FormViewModel(), isPresented: $isPresented)
                }
            }
        }
    }
}



#Preview {
    ButtonCreateDecision()
}
