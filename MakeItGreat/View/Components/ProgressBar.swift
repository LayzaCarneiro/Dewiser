//
//  ProgressBar.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double = 0
    var total: Double = 100
    var color: Color // Propriedade para a cor personalizada

    var body: some View {
        ProgressView(value: progress, total: total)
            .progressViewStyle(BarProgressStyle(color: color)) // Usa a cor passada
            .padding()
            .animation(.easeInOut(duration: 0.5), value: progress) // Adiciona a animação
    }
}

struct BarProgressStyle: ProgressViewStyle {
    var color: Color = .green

    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0.0

        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color(.white))
                .frame(height: 17)
                .frame(width: 127)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.strokecard, lineWidth: 4)
                        .frame(width: 127, height: 17)
                )
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(color)
                        .frame(width: 127 * progress)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.strokecard, lineWidth: 4)
                                .frame(width: 127 * progress)
                        )
                        .overlay {
                            if let currentValueLabel = configuration.currentValueLabel {
                                currentValueLabel
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                }
        }
    }
}


