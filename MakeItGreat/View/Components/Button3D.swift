//
//  Button.swift
//  MakeItGreat
//
//  Created by Hadassa Vitoria on 15/10/24.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    var colorButton: Color = .yellowCustom
    var colorShadow: Color = .textCreateButton

    @State private var isAbleHaptics: Bool = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true

    func makeBody(configuration: Configuration) -> some View {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)

        ZStack {
            let offset: CGFloat = 6
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 254, height: 76)
                .foregroundStyle(colorShadow)
                .offset(y: 6)

            RoundedRectangle(cornerRadius: 30)
                .frame(width: 254, height: 76)
                .foregroundStyle(colorButton)
                .offset(y: configuration.isPressed ? offset : 0)

            configuration.label
                .offset(y: configuration.isPressed ? offset : 0)
        }
        .onAppear {
            isAbleHaptics = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true
        }
        .onChange(of: configuration.isPressed) { _, isPressed in
            if isPressed && isAbleHaptics {
               feedbackGenerator.impactOccurred()
           }
       }
        .compositingGroup()
    }
}
