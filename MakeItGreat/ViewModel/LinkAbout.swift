//
//  LinkAbout.swift
//  MakeItGreat
//
//  Created by Joao Roberto Fernandes Magalhaes on 27/09/24.
//

import Foundation
import SwiftUI

func openLinkedInJR() {
    if let url = URL(string: "https://www.linkedin.com/in/jo%C3%A3o-roberto-72a05b217/") {
        UIApplication.shared.open(url)
    }
}
func openLinkedInHM() {
    if let url = URL(string: "https://www.linkedin.com/in/hadassa-miranda-525027227/") {
        UIApplication.shared.open(url)
    }
}
func openLinkedInLC() {
    if let url = URL(string: "https://www.linkedin.com/in/layzacarneiro/") {
        UIApplication.shared.open(url)
    }
}
func openLinkedInMG() {
    if let url = URL(string: "https://www.linkedin.com/in/melissa-guedes-a05560216/") {
        UIApplication.shared.open(url)
    }
}
