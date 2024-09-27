//
//  SettingsView.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 27/09/24.
//

import SwiftUI

struct SettingsView: View {
 @State private var isOn = false
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Notification")) {
                    Toggle(isOn : $isOn) {
                        Text("Able notifications")
                    }
                }
                Section(header: Text("Privacy")) {
                    Toggle(isOn : $isOn) {
                        Text("Lock App")
                    }
                }
                Section(header: Text("Development")) {
                    NavigationLink(destination: AboutView()) {
                        Text("About")
                    }
                }
            }.navigationBarTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
