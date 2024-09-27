//
//  ProViewModel.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import Foundation

class ProViewModel: ObservableObject {
    @Published var pros: [ProModel] = []
    @Published var cons: [ProModel] = []

    func addPro(content: String) {
        pros.append(ProModel(content: content))
    }
    
    func addCon(content: String) {
        cons.append(ProModel(content: content))
    }
}
