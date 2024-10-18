//
//  AuthenticationManager.swift
//  MakeItGreat
//
//  Created by Melissa Freire Guedes on 16/10/24.
//

import SwiftUI
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    //
    @Published var isFaceIDEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isFaceIDEnabled, forKey: "isFaceIDEnabled")
        }
    }
    @Published var isUnlocked: Bool = false
    @Published var statusMessage: String = "Blocked"
    //
    init() {
        self.isFaceIDEnabled = UserDefaults.standard.bool(forKey: "isFaceIDEnabled")
    }
    //
    func authenticate() {
        //
        let context = LAContext()
        var error: NSError?
        //
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: "This is for security reasons") { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.statusMessage = "Unlocked"
                        self.isUnlocked = true
                    } else {
                        self.statusMessage = "Try again!"
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.statusMessage = "The iPhone doesn't have a biometrics system!"
            }
        }
    }
}
