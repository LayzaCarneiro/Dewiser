//
//  ButtonCreateDecision.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 09/10/24.
//

import SwiftUI
import SwiftData
import UIKit

struct ButtonCreateDecision: View {
    @State private var isPresented: Bool = false
    @Query var decisions: [CardModel]
    @State private var deleteOnForDecision: Bool = false
    @Environment(\.modelContext) var context
    let generator = UIImpactFeedbackGenerator(style: .rigid)
    @State private var isAbleHaptics: Bool = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true

    var body: some View {
        ZStack {
            Button {
                if isAbleHaptics {
                    generator.impactOccurred()
                }
                isPresented.toggle()
            } label: {
                Text("Create a decision")
                    .font(.title2)
                    .fontWeight(.black)
                    .fontDesign(.rounded)
                    .foregroundColor(.black)
            }
            .buttonStyle(CustomButtonStyle(isAbleHaptics: isAbleHaptics))  // Aplicando o estilo personalizado com isAbleHaptics

            .fullScreenCover(isPresented: $isPresented) {
                NavigationView {
                    FirstPage(formViewModel: FormViewModel(), isPresented: $isPresented)
                }
            }
        }
        .onAppear {
            isAbleHaptics = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true
        }
    }
}

#Preview {
    ButtonCreateDecision()
}

struct CustomButtonStyle: ButtonStyle {
    let isAbleHaptics: Bool  // Adicionando o controle de haptics no estilo
    func makeBody(configuration: Configuration) -> some View {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
        let offset: CGFloat = 5
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 254, height: 76)
                .foregroundStyle(.textCreateButton)
                .offset(y: 6)
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 254, height: 76)
                .foregroundStyle(.yellowCustom)
                .offset(y: configuration.isPressed ? offset : 0)
            configuration.label
                .offset(y: configuration.isPressed ? offset : 0)
        }
        .onChange(of: configuration.isPressed) { isPressed in
            if isPressed, isAbleHaptics {
                feedbackGenerator.impactOccurred()
            }
        }
        .compositingGroup()
    }
}


#Preview {
    ButtonCreateDecision()
}
