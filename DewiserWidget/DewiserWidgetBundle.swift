//
//  DewiserWidgetBundle.swift
//  DewiserWidget
//
//  Created by Joao Roberto Fernandes Magalhaes on 03/10/24.
//

import WidgetKit
import SwiftUI

@main
struct DewiserWidgetBundle: WidgetBundle {
    var body: some Widget {
        DewiserWidget()
        DewiserWidgetControl()
        DewiserWidgetLiveActivity()
    }
}
