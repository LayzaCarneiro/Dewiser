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

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [CardModel.self, ProModel.self, ConModel.self])
    }
}
