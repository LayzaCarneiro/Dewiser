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
        NavigationStack {
            VStack(spacing: 60) {

                Text("Animation")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 250, height: 250)
                    .background(.yellow)
                    .cornerRadius(10)

                Button {
                    sheetNewDecision.toggle()
                } label: {
                    Text("New Decision")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 150, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $sheetNewDecision) {
                    FormSheetView()
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
            }
            .padding()
            .navigationTitle("My Decisions")
            .toolbar {
                Button {
                    // TODO: new page to search
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                Button {
                    // TODO: new page to settings
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
