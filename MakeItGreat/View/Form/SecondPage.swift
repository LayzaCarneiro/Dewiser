//
//  SecondPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct SecondPage: View {
    @ObservedObject var formViewModel: FormViewModel
    @Binding var isPresented: Bool
    @Environment(\.dismiss) var dismiss
    var feelings = ["Insecure", "Angry", "Ok", "Good", "Confident"]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                //
                VStack {
                    Text("How are you feeling about this decision?")
                        .font(.largeTitle)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .padding(.top, 50)
                    //
                    SliderFeeling(formViewModel: formViewModel)
                    //
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("New Decision")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                } label: {
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: ThirdPage(formViewModel: formViewModel, isPresented: $isPresented)) {
                    Text("Next")
                }
            }
        }
    }
}
