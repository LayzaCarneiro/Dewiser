//
//  AboutView.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 27/09/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                List {
                    Section(header: Text("Developers")) {
                        Button(action: openLinkedInHM) {
                            HStack {
                                ZStack {
                                    Image("hadassamiranda")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                        .frame(width: 30, height: 30)
                                }
                                Text("Hadassa Miranda")
                            }
                        }
                        Button(action: openLinkedInJR) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.icon)
                                        .frame(width: 30, height: 30)
                                    Image("joaoroberto")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                        .frame(width: 30, height: 30)
                                }
                                Text("João Roberto")
                            }
                        }
                        Button(action: openLinkedInLC) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.icon)
                                        .frame(width: 30, height: 30)
                                    Image( "layzacarneiro")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                        .frame(width: 30, height: 30)
                                }
                                Text("Layza Carneiro")
                            }
                        }
                        Button(action: openLinkedInMG) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.icon)
                                        .frame(width: 30, height: 30)
                                    Image("melissaguedes")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                        .frame(width: 30, height: 30)
                                }
                                Text("Melissa Guedes")
                            }
                        }
                    }
                    Section(header: Text("App")) {
                        Button(action: openSite) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.icon)
                                        .frame(width: 30, height: 30)
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15))
                                }
                                Text("Rate the app")
                            }
                        }
                    }
                    Section(header: Text("More Info")) {
                        Button(action: openSite) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.icon)
                                        .frame(width: 30, height: 30)
                                    Image(systemName: "globe")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15))
                                }
                                Text("Website")
                            }
                        }
                    }
                }
                .scrollDisabled(true)
                .scrollContentBackground(.hidden)
                .navigationBarTitle("About")
            }
        }
    }
}

#Preview {
    AboutView()
}
