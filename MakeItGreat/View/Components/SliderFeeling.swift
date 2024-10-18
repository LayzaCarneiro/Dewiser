//
//  SliderFeeling.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 02/10/24.
//

import SwiftUI
import UIKit

struct SliderFeeling: View {
    @ObservedObject var formViewModel: FormViewModel
    @State var sliderValue: Double = 5
    @State var previousValue: Int = 5
    let generator = UIImpactFeedbackGenerator(style: .rigid)
    //
    let feeling: [Int: String] = [1: "Insecure", 2: "Angry", 3: "Ok", 4: "Good", 5: "Confident"]
    let color: [Int: Color] = [1: .insecure, 2: .angry, 3: .ok, 4: .good, 5: .confident]
    //
    var body: some View {
        VStack {
            Text("Feeling: \(feeling[Int(sliderValue)] ?? "Unknown")")
                .font(.title2)
                .fontWeight(.bold)
            //
            Slider(value: $sliderValue, in: 1...5)
                .rotationEffect(.degrees(-90.0), anchor: .center)
                .padding(.top, 250)
                .accentColor(color[Int(sliderValue)])
        }
        .padding()
        .onAppear {
            generator.prepare()
        }
        .onChange(of: sliderValue) { _, value in
            let roundedValue = Int(round(value))
            if roundedValue != previousValue {
                generator.impactOccurred()
                previousValue = roundedValue
            }
            formViewModel.cardModel.feeling = feeling[Int(value)] ?? "ok"
        }
    }
}
