//
//  UserViewModel.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var userModel = UserModel()

    func addDecision() {
        userModel.decisions.append(CardModel())
        print(userModel.decisions)
    }
}
