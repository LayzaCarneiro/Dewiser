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
                                           Text("Hadassa Miranda")
                                       }
                    Button(action: openLinkedInJR) {
                                           Text("João Roberto")
                                       }
                    Button(action: openLinkedInLC) {
                                           Text("Layza Carneiro")
                                       }
                    Button(action: openLinkedInMG) {
                                           Text("Melissa Guedes")
                                       }
                }
                Section(header: Text("App")) {
                    NavigationLink(destination: SettingsView()) {
                        Text("Rate the App")
                    }
                }
                Section(header: Text("More Info")) {
                    NavigationLink(destination: SettingsView()) {
                        Text("Website")
                    }
                }
            }.navigationBarTitle("About")
        }
    }
}

#Preview {
    AboutView()
}
