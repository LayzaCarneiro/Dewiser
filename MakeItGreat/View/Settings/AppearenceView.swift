//
//  AppearenceView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/10/24.
//

import SwiftUI

struct AppearenceView: View {
    @EnvironmentObject var appSettings: AppSettings
    @AppStorage("active_icon") var activeAppIcon: String = "AppIcon"
    @State private var showingIconPicker = false

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            List {
                Section(header: Text("Appearance").foregroundColor(.accentColor)) {
                    Toggle(isOn: $appSettings.isDarkModeOn) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.icon)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "moon.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                            }
                            Text("Dark Mode")
                        }
                    }
                    .tint(.icon)
                        //
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.icon)
                                .frame(width: 30, height: 30)
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                        }
                        Text("Change App Icon")
                        Spacer()
                        Button {
                            showingIconPicker = true
                        } label: {
                            Image(activeAppIcon)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(5)
                                .frame(width: 30, height: 30)
                        }
                    }
                }
                .onChange(of: activeAppIcon) { _, icon in
                    UIApplication.shared.setAlternateIconName(activeAppIcon) { error in
                        if let error = error {
                            print("Error setting alternate icon: \(error)")
                        } else {
                            print("Icon set to: \(icon)")
                        }
                    }
                }
            }
            .scrollDisabled(true)
            .scrollContentBackground(.hidden)
            .navigationBarTitle("Appearance")
            .sheet(isPresented: $showingIconPicker) {
                IconPicker(activeAppIcon: $activeAppIcon)
                    .presentationDetents([.height(400)])
            }
        }
    }
}

struct IconPicker: View {
    @Binding var activeAppIcon: String

    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        let customIcons = ["AppIcon", "AppIcon 1", "AppIcon 2", "AppIcon 3", "AppIcon 4"]

                        ForEach(customIcons, id: \.self) { icon in
                            Button {
                                activeAppIcon = icon
                                if icon == "AppIcon" {
                                    UIApplication.shared.setAlternateIconName(nil)
                                } else {
                                    UIApplication.shared.setAlternateIconName(icon)
                                }
                            } label: {
                                VStack {
                                    Image(icon)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(10)
                                        .frame(width: 90, height: 90)
                                }
                                .padding()
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Select an Icon")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

class AppSettings: ObservableObject {
    @Published var isDarkModeOn: Bool {
        didSet {
            UserDefaults.standard.set(isDarkModeOn, forKey: "isDarkModeOn")
        }
    }

    init(colorScheme: ColorScheme) {
        if let savedDarkModePreference = UserDefaults.standard.object(forKey: "isDarkModeOn") as? Bool {
            self.isDarkModeOn = savedDarkModePreference
        } else {
            self.isDarkModeOn = (colorScheme == .dark)
            UserDefaults.standard.set(self.isDarkModeOn, forKey: "isDarkModeOn")
        }
    }
}

#Preview {
    AppearenceView()
}
