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
                        Text("You don't have any decisions yet")
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(decisions) { decision in
                            NavigationLink(destination: DecisionView(decision: decision)) {
                                DecisionCard(card: decision)
                            }                            
                        }
                    }
                }

                Button {
                    sheetNewDecision.toggle()
                } label: {
                    Text("Create Decision")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(.black)
                        .frame(width: 272, height: 70)
                        .background(.blue)
                        .cornerRadius(30)
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
                NavigationLink(destination: SearchView()) {
                    Image(systemName: "magnifyingglass")
                }
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
