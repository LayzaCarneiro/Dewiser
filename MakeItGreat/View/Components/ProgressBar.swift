//
//  progressBar.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 27/09/24.
//

import SwiftUI

struct ProgressBar: View {
    @State var progress: Double = 0
    @State var total: Double = 100


    var body: some View {
        ProgressView(value: progress, total: total)
            .progressViewStyle(BarProgressStyle(color: .green))
            .padding()
            .animation(.spring)
    }
}

struct BarProgressStyle: ProgressViewStyle {
    var color: Color = .green
    var height: Double = 16.0

    func makeBody(configuration: Configuration) -> some View {

        let progress = configuration.fractionCompleted ?? 0.0

//        GeometryReader { geometry in

            VStack(alignment: .leading) {

                RoundedRectangle(cornerRadius: 10.0)
                    .fill(.gray)
                    .frame(height: height)
                    .frame(width: 100)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(color)
                            .frame(width: 100 * progress)
                            .overlay {
                                if let currentValueLabel = configuration.currentValueLabel {
                                    currentValueLabel
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                            }
                    }

            }

//        }
    }
}

#Preview {
    ProgressBar()
}
