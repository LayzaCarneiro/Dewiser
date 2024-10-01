//
//  HomeScreen.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 28/09/24.
//

import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @State private var sheetNewDecision = false

    @Query var decisions: [CardModel]

    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {

                if decisions.isEmpty {
                    ContentUnavailableView {
                        Label("No decisions", systemImage: "tray.fill")
                    } description: {
                        Text("You don't have any decisions.")
                    }
                } else {
                    ScrollView(.vertical) {
                        ForEach(decisions) { decision in
                            DecisionCard(card: decision)
                        }
                    }
                }

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
                        .presentationDetents([.large])
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
    HomeScreenView()
}
