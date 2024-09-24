//
//  ContentView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sheetNewDecision = false
    
    var body: some View {
        VStack(spacing: 25) {
                        
            Button {
                sheetNewDecision.toggle()
            } label: {
                Text("New Decision")
            }
            .sheet(isPresented: $sheetNewDecision, onDismiss: didDismiss) {
                    FormSheetView()
            }
        }
        .padding()
    }
    
    func didDismiss() {
        // TODO: Handle the dismissing action
    }
}

#Preview {
    ContentView()
}
