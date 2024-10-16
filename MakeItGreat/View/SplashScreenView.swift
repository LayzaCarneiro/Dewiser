//
//  SplashScreenView.swift
//  MakeItGreat
//
//  Created by Hadassa Vitoria on 16/10/24.
//

import SwiftUI
import Lottie

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.splashscreencolor
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer(minLength: 50)
                LottieView(animation: .named("animation"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                    .frame(width: 400, height: 400)
                Spacer()
                Text("Dewiser")
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                    .fontWeight(.black)
                    .foregroundStyle(Color.splashscreentext)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
            }
        }
    }
}
#Preview {
    SplashScreenView()
}
