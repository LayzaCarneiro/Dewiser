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
            Color.clear
            Image("nodecisions")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity, alignment: .bottom) 
                .ignoresSafeArea()

            VStack(spacing: 25) {
                ContentUnavailableView {
                    Spacer()
                    Label("""
                        You don't have any 
                        decision yet.
                        """, systemImage: "")
                        .font(.title)
                        .fontDesign(.rounded)
                        .fontWidth(.compressed)
                        .fontWeight(.black)
                        .foregroundColor(.white)

                }
                
                ButtonCreateDecision()
                    .padding(.bottom, 6)

            }
        }
    }
}

#Preview {
    NoDecisionsView()
}
