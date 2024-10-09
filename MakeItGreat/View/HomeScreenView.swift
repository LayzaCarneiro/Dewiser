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
            ZStack {
                Color.colorbackground.ignoresSafeArea()
                VStack {
                    if decisions.isEmpty {
                        NoDecisionsView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.clear)
                    } else {
                        HaveDecisionsView()
                    }
                }
                .navigationTitle("My Decisions")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SearchView()) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color(UIColor.label))
                                .bold()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                                .foregroundStyle(Color(UIColor.label))
                                .bold()
                        }
                    }
                }
            }
        }
    }
}
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
