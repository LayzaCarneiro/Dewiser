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

    var body: some Scene {
        WindowGroup {
            ContentView()
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
