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
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "bell.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("Daily Reminder")
                        }
                    }
                    Toggle(isOn: $isAbleHaptics) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "speaker.wave.2")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("Disable haptics")
                        }
                    }
                }
                Section(header: Text("Privacy")) {
                    Toggle(isOn: $isLockAppOn) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "lock")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("Face ID")
                        }
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
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("More info")
                        }
                    }
                }
            }.navigationBarTitle("Settings")
        }
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "O Face ID será utilizado para suas decisões se manterem em segredo"
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
