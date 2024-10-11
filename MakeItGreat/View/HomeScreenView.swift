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
                Color.background.ignoresSafeArea()
                VStack {
                    if decisions.isEmpty {
                        Text("My Decisions")
                            .font(.largeTitle)
                            .fontDesign(.rounded)
                            .fontWidth(.compressed)
                            .fontWeight(.black)
                            .foregroundColor(.textcolormd)
                            .padding(.trailing, 100)
                            .padding(.top, 30)
                        NoDecisionsView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.clear)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    HStack {
                                        NavigationLink(destination: SearchView()) {
                                            Image(systemName: "magnifyingglass")
                                                .foregroundStyle(Color(UIColor.label))
                                                .fontWeight(.bold)
                                        }
                                        NavigationLink(destination: SettingsView()) {
                                            Image(systemName: "gear")
                                                .foregroundStyle(Color(UIColor.label))
                                                .fontWeight(.bold)
                                        }
                                    }
                                }
                            }
                    } else {
                        HaveDecisionsView()
                            .background(Color.procard)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    HStack {
                                        NavigationLink(destination: SearchView()) {
                                            Image(systemName: "magnifyingglass")
                                                .foregroundStyle(.itemcardcolor)
                                                .fontWeight(.bold)
                                        }
                                        NavigationLink(destination: SettingsView()) {
                                            Image(systemName: "gear")
                                                .foregroundStyle(.itemcardcolor)
                                                .fontWeight(.bold)
                                        }
                                    }
                                }
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
