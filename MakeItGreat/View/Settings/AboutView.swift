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
            List {
                Section(header: Text("Developers")) {
                    Button(action: openLinkedInHM) {
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("Hadassa Miranda")
                        }
                    }
                    Button(action: openLinkedInJR) {
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("João Roberto")
                        }
                    }
                    Button(action: openLinkedInLC) {
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("Layza Carneiro")
                        }
                    }
                    Button(action: openLinkedInMG) {
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("Melissa Guedes")
                        }
                    }
                }
                Section(header: Text("App")) {
                    NavigationLink(destination: SettingsView()) {
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
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
                    NavigationLink(destination: SettingsView()) {
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "globe")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("Website")
                        }
                    }
                }
            }.navigationBarTitle("About")
        }
    }
}

#Preview {
    AboutView()
}
