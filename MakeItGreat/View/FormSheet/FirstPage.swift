//
//  FirstPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct FirstPage: View {
    @ObservedObject var formViewModel: FormViewModel
    
    var body: some View {
        VStack {
            Text("What is your decision?")
            TextField("Decision", text: $formViewModel.title)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Spacer()
                Button {
                    formViewModel.nextPage()
                } label: {
                    Text("Próximo")
                }
            }
        }
    }
}

//#Preview {
//    FirstPage()
//}
