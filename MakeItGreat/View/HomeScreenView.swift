//
//  HomeScreen.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 28/09/24.
//

import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @State private var isPresented: Bool = false

    @Query var decisions: [CardModel]

    @State private var deleteOnForDecision: Bool = false

    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack {
            VStack {
                if decisions.isEmpty {
                    ContentUnavailableView {
                        Label("No decisions", systemImage: "tray.fill")
                            .fontDesign(.rounded)
                    } description: {
                        Text("You don't have any decisions yet")
                            .fontDesign(.rounded)
                    }
                } else {
                    Button {
                        deleteOnForDecision.toggle()
                    } label: {
                        Text("Delete cards")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        ForEach(decisions.reversed()) { decision in
                            HStack {
                                NavigationLink(destination: DecisionView(decision: decision)) {
                                    DecisionCard(card: decision)
                                }
                                if deleteOnForDecision {
                                    Button {
                                        context.delete(decision)
                                    } label: {
                                        Image(systemName: "trash")
                                            .padding()
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                }
                            }
                        }
                    }
                }
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Create a decision")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(.primary)
                        .frame(width: 254, height: 76)
                        .background(.secondary)
                        .cornerRadius(30)
                }
                .fullScreenCover(isPresented: $isPresented) {
                    NavigationView {
                        FirstPage(formViewModel: FormViewModel(), isPresented: $isPresented)
                    }
                }
            }
            .padding()
            .navigationTitle("My Decisions")
            .fontDesign(.rounded)
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

//#Preview {
//    HomeScreenView()
//}
