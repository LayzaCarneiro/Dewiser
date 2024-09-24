//
//  FormSheetView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct FormSheetView: View {
    @StateObject var formViewModel = FormViewModel()
    
    var body: some View {
        VStack {
            switch formViewModel.currentPage {
            case 0:
                FirstPage(formViewModel: formViewModel)
            case 1:
                SecondPage(formViewModel: formViewModel)
            case 2:
                ThirdPage(formViewModel: formViewModel)
            default:
                FirstPage(formViewModel: formViewModel)
            }
        }
    }
}

#Preview {
    FormSheetView()
}
