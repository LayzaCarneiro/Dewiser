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

            VStack {
                ContentUnavailableView {
                    Spacer()
                    Label("""
                        You don't have any 
                        decisions yet
                        """, systemImage: "")
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                ButtonCreateDecision()
                .padding(.bottom, 30)
                .background(Color.clear)
            }
        }
    }
}

#Preview {
    NoDecisionsView()
}
