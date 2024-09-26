//
//  FormViewModel.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import Foundation

class FormViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var notes: String = ""
    @Published var currentPage: Int = 0

    func nextPage() {
        if currentPage < 3 {
            currentPage += 1
        }
    }

    func previousPage() {
        if currentPage > 0 {
            currentPage -= 1
        }
    }
}
