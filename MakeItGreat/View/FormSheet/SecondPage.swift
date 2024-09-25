//
//  SecondPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct SecondPage: View {
    @ObservedObject var formViewModel: FormViewModel
    
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
                    formViewModel.nextPage()
                } label: {
                    Text("Next")
                }
            }
            
            Text("What is about?")
            TextField("Description", text: $formViewModel.description)
                .textFieldStyle(.roundedBorder)
        }
    }
}

//#Preview {
//    SecondPage()
//}
