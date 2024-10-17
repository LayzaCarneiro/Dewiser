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
                VStack {
                    Spacer()
                    Spacer(minLength: 200)
                    LottieView(animation: .named("animation"))
                        .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                        .frame(width: 500, height: 500)
                    Spacer()
                    Text("Dewiser")
                        .font(.system(size: 45))
                        .fontDesign(.rounded)
                        .fontWeight(.black)
                        .foregroundStyle(Color.splashscreentext)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                }
                .padding()
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        self.ativado = true
                    }
                }
            }
        }
    }
}
        
#Preview {
    SplashScreenView()
}
