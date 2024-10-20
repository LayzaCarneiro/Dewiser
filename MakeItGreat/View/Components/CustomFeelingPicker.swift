//
//  CustomFeelingPicker.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 07/10/24.
//

import SwiftUI

struct CustomFeelingPicker: View {
    @Binding var selectedFeeling: String
    @State private var isAbleHaptics: Bool = UserDefaults.standard.object(forKey: "isAbleHaptics") as? Bool ?? true
    let generator = UIImpactFeedbackGenerator(style: .rigid)

    var body: some View {
        HStack(spacing: 23) {
            Button {
                if isAbleHaptics {
                    generator.impactOccurred()
                }
                selectedFeeling = "Insecure"
            } label: {
                FeelingItem(feelTitle: "Insecure", feelImage: "insecureFace", selected: "Insecure" == selectedFeeling)
            }
            Button {
                if isAbleHaptics {
                    generator.impactOccurred()
                }
                selectedFeeling = "Angry"
            } label: {
                FeelingItem(feelTitle: "Angry", feelImage: "angryFace", selected: "Angry" == selectedFeeling)
            }
            Button {
                if isAbleHaptics {
                    generator.impactOccurred()
                }
                selectedFeeling = "Ok"
            } label: {
                FeelingItem(feelTitle: "Ok", feelImage: "okFace", selected: "Ok" == selectedFeeling)
            }
            Button {
                if isAbleHaptics {
                    generator.impactOccurred()
                }
                selectedFeeling = "Good"
            } label: {
                FeelingItem(feelTitle: "Good", feelImage: "goodFace", selected: "Good" == selectedFeeling)
            }
            Button {
                if isAbleHaptics {
                    generator.impactOccurred()
                }
                selectedFeeling = "Confident"
            } label: {
                // swiftlint:disable:next line_length
                FeelingItem(feelTitle: "Confident", feelImage: "confidentFace", selected: "Confident" == selectedFeeling)
            }
        }
    }
}
