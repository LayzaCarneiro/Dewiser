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
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 25) {
                Spacer(minLength: 250)
                GeometryReader { geometry in
                ContentUnavailableView {
                    
                        Text("You don't have any decision yet.")
                            .font(.system(size: geometry.size.width * 0.05))
                            .font(.title)
                            .fontDesign(.rounded)
                            .fontWidth(.compressed)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    
                }
                
                ButtonCreateDecision()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    NoDecisionsView()
}