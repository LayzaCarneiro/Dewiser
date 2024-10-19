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
                .aspectRatio(contentMode: UIScreen.main.bounds.width < 376 || UIScreen.main.bounds.width >= 768 ? .fill : .fit)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 25) {
                Spacer(minLength: UIScreen.main.bounds.width < 376 ? 250 : 380)
                GeometryReader { geometry in
                ContentUnavailableView {
                        Text("You don't have any decision yet.")
                            .font(.system(size: geometry.size.width * 0.06))
                            .font(.title)
                            .fontDesign(.rounded)
                            .fontWidth(.compressed)
                            .fontWeight(.heavy)
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
