//
//  SplashScreenView.swift
//  MakeItGreat
//
//  Created by Hadassa Vitoria on 16/10/24.
//

import SwiftUI
import Lottie

struct SplashScreenView: View {
    @State private var ativado = false
    var body: some View {
        if ativado {
            OnboardingView()
        } else {
            ZStack {
                Color.splashscreencolor
                    .ignoresSafeArea()
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Spacer(minLength: 200)
                        LottieView(animation: .named("animation"))
                            .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                            .frame(width: min(geometry.size.width * 0.8, 500), height: min(geometry.size.width * 0.8, 500))
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        Text("Dewiser")
                            .font(.system(size: min(geometry.size.width * 0.1, 45)))
                            .fontDesign(.rounded)
                            .fontWeight(.black)
                            .foregroundStyle(Color.white)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            self.ativado = true
                        }
                    }
                }
            }
        }
    }
}
        
#Preview {
    SplashScreenView()
}
