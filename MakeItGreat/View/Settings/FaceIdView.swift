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
                //
                VStack(alignment: .center) {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 25, height: 36)
                        .foregroundStyle(Color.textCreateButton)
                    //
                    Text(authManager.statusMessage)
                        .bold()
                        .foregroundStyle(Color.textCreateButton)
                        .padding()
                    //
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("textCreateButton"))
                            .frame(width: 120, height: 30)
                        //
                        Button("Unlock") {
                            if authManager.isFaceIDEnabled {
                                authManager.authenticate()
                            } else {
                                authManager.statusMessage = "Biometrics is not enabled."
                            }
                        }
                        .foregroundStyle(Color.white)
                    }
                }
                .navigationDestination(isPresented: $authManager.isUnlocked) {
                    HomeScreenView()
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
