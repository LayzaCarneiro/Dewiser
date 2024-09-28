//
//  FormSheetView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct FormSheetView: View {
    @StateObject var formViewModel = FormViewModel()
    @StateObject var cardViewModel = CardViewModel()
    @StateObject var userViewModel = UserViewModel()

    var body: some View {
        VStack {
            switch formViewModel.currentPage {
            case 0:
                FirstPage(formViewModel: formViewModel, cardViewModel: cardViewModel)
            case 1:
                SecondPage(formViewModel: formViewModel, cardViewModel: cardViewModel)
            case 2:
                ThirdPage(formViewModel: formViewModel, cardViewModel: cardViewModel)
            case 3:
                FourthPage(formViewModel: formViewModel, cardViewModel: cardViewModel, userViewModel: userViewModel)
            default:
                FirstPage(formViewModel: formViewModel, cardViewModel: cardViewModel)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    FormSheetView()
}
