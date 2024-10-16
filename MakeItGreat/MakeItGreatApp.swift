//
//  MakeItGreatApp.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

@main
struct MyApp: App {
    @State private var isFormSheetActive = false // Controla a exibição do FormSheetView

    var body: some Scene {
        WindowGroup {
            ContentView() // A view principal do seu app
                .onOpenURL { url in
                    // Verifica o URL e ativa o FormSheetView quando o link "myapp://formsheet" for clicado
                    if url.scheme == "myapp" && url.host == "formsheet" {
                        isFormSheetActive = true
                    }
                }
                .sheet(isPresented: $isFormSheetActive) {
                    FormSheetView() // Apresenta a FormSheetView
                }
        }
    }
}
