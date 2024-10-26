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
                Spacer(minLength: UIScreen.main.bounds.width < 376 ? 150 : 250)
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
                            .disabled(true)
                    }
                    HStack {
                        Spacer()
                        ButtonCreateDecision()
    //                        .padding(.leading, geometry.size.height * 0.2)
                            .padding(.top, geometry.size.width * 0.7)
                        Spacer()
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    NoDecisionsView()
}
