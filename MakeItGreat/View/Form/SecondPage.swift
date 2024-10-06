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
    @State private var selectedFeeling = "Ok"

    var body: some View {
        NavigationStack {
            VStack {
                Text("How are you feeling about this decision?")
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .padding(.top, 50)
//                TextField("Feeling", text: $formViewModel.cardModel.feeling)
//                    .textFieldStyle(.roundedBorder)
                
                Picker("", selection: $selectedFeeling) {
                    ForEach(feelings, id: \.self) {
                        Text($0)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("New Decision")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: ThirdPage(formViewModel: formViewModel, isPresented: $isPresented)) {
                    Text("Next")
                }
            }
        }
    }
}
