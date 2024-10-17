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
    @State private var isAbleHaptics: Bool = UserDefaults.standard.bool(forKey: "isAbleHaptics")
    @EnvironmentObject var authManager: AuthenticationManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                List {
                    Section(header: Text("Notification")) {
                        Toggle(isOn: $isNotificationOn) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.icon)
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
                                        .fill(Color.icon)
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

                    Section(header: Text("Segurança").foregroundColor(.accentColor)) {
                        Toggle(isOn: $authManager.isFaceIDEnabled) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.icon)
                                        .frame(width: 30, height: 30)
                                    Image(systemName: "info.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15))
                                        .frame(height: 30)
                                }
                                Text("Face ID")
                            }
                        }
                        .tint(.accentColor)
                    }

                    Section(header: Text("Development")) {
                        NavigationLink(destination: AboutView()) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.icon)
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
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitle("Settings")
            .onAppear {
                isNotificationOn = UserDefaults.standard.bool(forKey: "isNotificationOn")
                isAbleHaptics = UserDefaults.standard.bool(forKey: "isAbleHaptics")
            }
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
        .environmentObject(AuthenticationManager())
}
