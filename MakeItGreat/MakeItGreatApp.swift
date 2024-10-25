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
    @State private var isFormSheetActive = false
    @State var isPresented: Bool = false

    @StateObject private var appSettings: AppSettings

    init() {
        let initialColorScheme: ColorScheme = UIScreen.main.traitCollection.userInterfaceStyle == .dark ? .dark : .light
        _appSettings = StateObject(wrappedValue: AppSettings(colorScheme: initialColorScheme))
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appSettings)
                .preferredColorScheme(appSettings.isDarkModeOn ? .dark : .light)
                .onOpenURL { url in
                    if url.scheme == "myapp" && url.host == "formsheet" {
                        isFormSheetActive = true
                        isPresented = true
                    }
                }
                .fullScreenCover(isPresented: $isPresented) {
                    NavigationView {
                        FirstPage(formViewModel: FormViewModel(), isPresented: $isPresented)
                    }
                }
        }
        .modelContainer(for: [CardModel.self, ProModel.self, ConModel.self])
    }
}
