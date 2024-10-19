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
                Color.background.ignoresSafeArea()
                //
                VStack(alignment: .center) {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 25, height: 36)
                        .foregroundStyle(Color.purpleBackground)
                    //
                    Text(authManager.statusMessage)
                        .bold()
                        .foregroundStyle(Color.purpleBackground)
                        .fontDesign(.rounded)
                        .padding()
                        .lineLimit(1)
                    //
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.purpleBackground)
                            .frame(width: 120, height: 30)
                        //
                        Button("Unlock") {
                            if authManager.isFaceIDEnabled {
                                authManager.authenticate()
                            } else {
                                authManager.statusMessage = "Biometrics is not enabled."
                            }
                        }
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundStyle(Color.white)
                        .navigationDestination(isPresented: $authManager.isUnlocked) {
                            HomeScreenView()
                        }
                    }
                }
            }
        }
    }
}
//
#Preview {
    FaceIdView()
        .environmentObject(AuthenticationManager())
}
