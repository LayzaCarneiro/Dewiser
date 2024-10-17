//
//  MakeItGreatApp.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI
import SwiftData

@main
struct MakeItGreatApp: App {
    @StateObject private var authManager = AuthenticationManager()
    
    var body: some Scene {
        WindowGroup {
            if authManager.isFaceIDEnabled {
                FaceIdView()
                    .environmentObject(authManager)
            } else {
                HomeScreenView()
                    .environmentObject(authManager)
            }
        }
        .modelContainer(for: [CardModel.self, ProModel.self, ConModel.self])
    }
}
