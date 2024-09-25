//
//  ThirdPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct ThirdPage: View {
    @ObservedObject var formViewModel: FormViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            HStack {
                Button {
                    formViewModel.previousPage()
                } label: {
                    Text("Back")
                }
                Spacer()
                Button {
                    // MARK: it must save and not dismiss
                    // TODO: save decision
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
            
            Text("Something else")
            TextField("Description", text: $formViewModel.description)
                .textFieldStyle(.roundedBorder)
        }
    }
}
