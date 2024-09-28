//
//  HomeScreen.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 28/09/24.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject var userViewModel = UserViewModel()

    @State private var sheetNewDecision = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {

                if userViewModel.userModel.decisions.isEmpty {
                    ContentUnavailableView {
                        Label("No decisions", systemImage: "tray.fill")
                    } description: {
                        Text("You don't have any decisions.")
                    }
                } else {
                    ForEach(userViewModel.userModel.decisions) { decision in
                        DecisionCard()
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
