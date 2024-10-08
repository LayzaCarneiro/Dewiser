//
//  CustomFeelingPicker.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 07/10/24.
//

import SwiftUI

struct CustomFeelingPicker: View {
    @Binding var selectedFeeling: String
    
    var body: some View {
        HStack(spacing: 23) {
            Button {
                selectedFeeling = "Sad"
            } label: {
                FeelingItem(feelTitle: "Sad", feelImage: "sadFace", selected: "Sad" == selectedFeeling)
            }
            Button {
                selectedFeeling = "Angry"
            } label: {
                FeelingItem(feelTitle: "Angry", feelImage: "sadFace", selected: "Angry" == selectedFeeling)
            }
            Button {
                selectedFeeling = "Ok"
            } label: {
                FeelingItem(feelTitle: "Ok", feelImage: "sadFace", selected: "Ok" == selectedFeeling)
            }
            Button {
                selectedFeeling = "Good"
            } label: {
                FeelingItem(feelTitle: "Good", feelImage: "sadFace", selected: "Good" == selectedFeeling)
            }
            Button {
                selectedFeeling = "Confident"
            } label: {
                FeelingItem(feelTitle: "Confident", feelImage: "sadFace", selected: "Confident" == selectedFeeling)
            }
        }
    }
}
