//
//  SettingsView.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 27/09/24.
//

import SwiftUI
import LocalAuthentication
import UserNotifications

struct SettingsView: View {
    @State private var isNotificationOn: Bool = UserDefaults.standard.bool(forKey: "isNotificationOn")
    @State private var isLockAppOn: Bool = UserDefaults.standard.bool(forKey: "isLockAppOn")
    @State private var isAbleHaptics: Bool = UserDefaults.standard.bool(forKey: "isAbleHaptics")
    @State private var isAuthenticated: Bool = UserDefaults.standard.bool(forKey: "isAuthenticated")

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
                    .onChange(of: isNotificationOn) { newValue in
                        UserDefaults.standard.set(newValue, forKey: "isNotificationOn")
                        if newValue {
                            requestNotificationPermission()
                        } else {
                            cancelNotifications()
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
                    .onChange(of: isAbleHaptics) { newValue in
                        UserDefaults.standard.set(newValue, forKey: "isAbleHaptics")
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
                        UserDefaults.standard.set(newValue, forKey: "isLockAppOn")
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
            }
            .navigationBarTitle("Settings")
            .onAppear {
                isNotificationOn = UserDefaults.standard.bool(forKey: "isNotificationOn")
                isAbleHaptics = UserDefaults.standard.bool(forKey: "isAbleHaptics")
                isLockAppOn = UserDefaults.standard.bool(forKey: "isLockAppOn")
            }
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

    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                scheduleRandomTimeReminder()
            } else {
                DispatchQueue.main.async {
                    isNotificationOn = false
                }
            }
        }
    }

    func scheduleRandomTimeReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Daily Reminder"
        content.body = "Make a decision now!"
        content.sound = UNNotificationSound.default
        let randomHour = Int.random(in: 13..<14)
        let randomMinute = Int.random(in: 22..<30)
        var dateComponents = DateComponents()
        dateComponents.hour = randomHour
        dateComponents.minute = randomMinute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "dailyRandomReminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Erro ao agendar a notificação: \(error.localizedDescription)")
            } else {
                print("Notificação agendada para \(randomHour):\(String(format: "%02d", randomMinute))")
            }
        }
    }

    func cancelNotifications() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["dailyRandomReminder"])
    }
}

#Preview {
    SettingsView()
}
