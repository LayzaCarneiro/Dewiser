//
//  ThirdPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct ThirdPage: View {
    @ObservedObject var formViewModel: FormViewModel
    
    var body: some View {
        VStack {
            Text("Something else")
            TextField("Description", text: $formViewModel.description)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Button {
                    formViewModel.previousPage()
                } label: {
                    Text("Anterior")
                }
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
//    ThirdPage()
//}
