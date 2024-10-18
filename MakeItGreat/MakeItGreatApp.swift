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
    @State private var isAuthenticated: Bool = false

    init() {
        _isAuthenticated = State(initialValue: !AuthenticationManager().isFaceIDEnabled)
    }

    var body: some Scene {
        WindowGroup {
            if !isAuthenticated {
                FaceIdView()
                    .environmentObject(authManager)
                    .onAppear {
                        isAuthenticated = !authManager.isFaceIDEnabled
                    }
            } else {
                ContentView()
                    .environmentObject(authManager)
            }
        }
        .modelContainer(for: [CardModel.self, ProModel.self, ConModel.self])
    }
}
