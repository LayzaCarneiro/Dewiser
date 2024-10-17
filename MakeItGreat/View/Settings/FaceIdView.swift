//
//  FaceIdView.swift
//  MakeItGreat
//
//  Created by Melissa Freire Guedes on 16/10/24.
//


import SwiftUI

struct FaceIdView: View {
    @EnvironmentObject var authManager: AuthenticationManager

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(stops: [
                    .init(color: .background, location: 0.90),
                    .init(color: .background, location: 1.02)
                ], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()

                VStack(alignment: .center) {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 25, height: 36)
                        .foregroundStyle(Color.background)
                    Text(authManager.statusMessage)
                        .bold()
                        .foregroundStyle(Color.background)
                        .padding()

                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("black"))
                            .frame(width: 120, height: 30)
                        Button("Desbloquear") {
                            if authManager.isFaceIDEnabled {
                                authManager.authenticate()
                            } else {
                                authManager.statusMessage = "A Biometria está desabilitada!"
                            }
                        }
                    }
                }
                .navigationDestination(isPresented: $authManager.isUnlocked) {
                    HomeScreenView()
                }
            }
        }
    }
}

#Preview {
    FaceIdView()
        .environmentObject(AuthenticationManager())
}
