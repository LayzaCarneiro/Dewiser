//
//  NoDecisionsView.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 09/10/24.
//

import SwiftUI

struct NoDecisionsView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear // Preenche o fundo para garantir que a área ocupe toda a tela

            Image("nodecisions")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity, alignment: .bottom) // Alinha a imagem no fundo
                .ignoresSafeArea()

            VStack {
                ContentUnavailableView {
                    Spacer()
                    Label("""
You don't have any 
decisions yet
""", systemImage: "")
                        .fontDesign(.rounded)
                }
                ButtonCreateDecision()
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    NoDecisionsView()
}
