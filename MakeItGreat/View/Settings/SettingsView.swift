//
//  SettingsView.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 27/09/24.
//

import SwiftUI
import LocalAuthentication

struct SettingsView: View {
    @State private var isNotificationOn = false
    @State private var isLockAppOn = false
    @State private var isAbleHaptics = false
    @State private var isAuthenticated = false
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Notification")) {
                    Toggle(isOn: $isNotificationOn) {
                        Text("Daily Reminder")
                    }
                    Toggle(isOn: $isAbleHaptics) {
                        Text("Disable Haptics")
                    }
                }
                Section(header: Text("Privacy")) {
                    Toggle(isOn: $isLockAppOn) {
                        Text("Face ID")
                    }
                    .onChange(of: isLockAppOn) { newValue in
                        if newValue {
                            authenticate()
                        } else {
                            isAuthenticated = false
                        }
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
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "O Face Id será utilizado para suas decisões se manterem em segredo"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        isAuthenticated = true
                    } else {
                        isLockAppOn = false
                    }
                }
            }
        } else {
            isLockAppOn = false
        }
    }
}

#Preview {
    SettingsView()
}
