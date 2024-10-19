//
//  NoSearchView.swift
//  MakeItGreat
//
//  Created by Melissa Freire Guedes on 10/10/24.
//

import SwiftUI
import  SwiftData

struct NoSearchView: View {
    @State var searchTerm: String = ""
    @Query var decisions: [CardModel]

    var filteredDecisions: [CardModel] {
        if searchTerm.isEmpty {
            return decisions
        } else {
            return decisions.filter { $0.title.localizedCaseInsensitiveContains(searchTerm) }
        }
    }

    var body: some View {
        NavigationStack {
                ZStack(alignment: .bottom) {
                    Color.background
                        .ignoresSafeArea()

                    Image("nodecisions")
                        .resizable()
                        .aspectRatio(contentMode: UIScreen.main.bounds.width >= 768 ? .fill : .fit)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .ignoresSafeArea()

                    VStack {
                        ContentUnavailableView {
                            Spacer()
                            Text("You don't have any decision yet.")
                                .font(.title2)
                                .fontDesign(.rounded)
                                .fontWidth(.compressed)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)
                                .padding(.bottom, 95)
                        }
                    }
            }
            .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search your decision cards")
            .onTapGesture {
                hideKeyboard()
            }
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    NoSearchView()
}
