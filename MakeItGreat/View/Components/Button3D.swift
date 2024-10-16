//
//  Button.swift
//  MakeItGreat
//
//  Created by Hadassa Vitoria on 15/10/24.
//

import SwiftUI

struct Buttonn: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let feedbackGenerator = UIImpactFeedbackGenerator(style:.heavy)
        ZStack {
            let offset: CGFloat = 5
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 254, height: 76)
                .foregroundStyle(.text)
                .offset(y:6)
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 254, height: 76)
                .foregroundStyle(.yellowPicker)
                .offset(y: configuration.isPressed ? offset : 0)
            
            configuration.label
                .offset(y: configuration.isPressed ? offset : 0)
        }
        .onChange(of: configuration.isPressed) { isPressed in
               if isPressed {
                   feedbackGenerator.impactOccurred()
               }
           }
        .compositingGroup()
    }
}

struct ButtonOnb: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let feedbackGenerator = UIImpactFeedbackGenerator(style:.heavy)
        ZStack {
            let offset: CGFloat = 5
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 254, height: 76)
                .foregroundStyle(.text)
                .offset(y:6)
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 254, height: 76)
                .foregroundStyle(Color(.background))
                .offset(y: configuration.isPressed ? offset : 0)
            
            configuration.label
                .offset(y: configuration.isPressed ? offset : 0)
        }
        .onChange(of: configuration.isPressed) { isPressed in
               if isPressed {
                   feedbackGenerator.impactOccurred()
               }
           }
        .compositingGroup()
    }
}
