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
    // swiftlint:disable:next line_length
    var imageBall: [String: String] = ["Insecure": "insecureBall", "Ok": "okBall", "Good": "goodBall", "Angry": "angryBall", "Confident": "confidentBall"]

    @State private var circleScale: CGFloat = 1.0

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                //
                Image(imageBall[formViewModel.cardModel.feeling] ?? "confidentFace")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)
                    .offset(y: 300)
                //
                VStack {
                    Text("How are you feeling about this decision?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 375, alignment: .top)
                        .padding(.top, 50)
                    //
                    SliderFeeling(formViewModel: formViewModel)
                        .frame(width: 300, height: 430)
                        .padding()
                    //
                    Spacer()
                }
                .padding()
                .fontDesign(.rounded)
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
struct
SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        let formViewModel = FormViewModel()
        @State var isPresented = true
        SecondPage(formViewModel: formViewModel, isPresented: $isPresented)
    }
}
