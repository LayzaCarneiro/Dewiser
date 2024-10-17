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
    @State private var deleteOnForDecision: Bool = false
    
    @Environment(\.modelContext) var context
    @EnvironmentObject var authManager: AuthenticationManager
    
    @Query var decisions: [CardModel]
    
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
                            .foregroundColor(.textTitle)
                            .padding(.trailing, 100)
                            .padding(.top, 30)

                        NoDecisionsView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.clear)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    HStack(spacing: 15) {
                                        NavigationLink(destination: SearchView()) {
                                            Image(systemName: "magnifyingglass")
                                                .resizable()
                                                .frame(width: 28, height: 28)
                                                .foregroundStyle(.text)
                                                .fontWeight(.bold)
                                        }
                                        NavigationLink(destination: SettingsView()) {
                                            Image(systemName: "gear")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(.text)
                                                .fontWeight(.bold)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 8)
                                }
                            }
                    } else {
                        HaveDecisionsView()
                            .background(Color.purpleBackground)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    HStack(spacing: 15) {
                                        NavigationLink(destination: SearchView()) {
                                            Image(systemName: "magnifyingglass")
                                                .resizable()
                                                .frame(width: 28, height: 28)
                                                .foregroundStyle(.textInverse)
                                                .fontWeight(.bold)
                                        }
                                        NavigationLink(destination: SettingsView()) {
                                            Image(systemName: "gear")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(.textInverse)
                                                .fontWeight(.bold)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 8)
                                }
                            }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
            .environmentObject(AuthenticationManager())
    }
}
