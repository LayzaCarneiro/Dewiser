//
//  FirstPage.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 24/09/24.
//

import SwiftUI

struct FirstPage: View {
    @ObservedObject var formViewModel: FormViewModel
    
    @State private var selectedPriority: Priority = .medium
    @Binding var isPresented: Bool
    
    enum Priority: String, CaseIterable, Identifiable {
        case low, medium, high
        var id: Self { self }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 42) {
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 3) {
                            Text("Title")
                                .font(.body)
                                .fontWeight(.bold)
                            Text("*")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundStyle(.red)
                        }
                        TextField("What is your decision title?", text: $formViewModel.cardModel.title)
                            .padding()
                            .frame(width: 361, height: 44)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.primary, lineWidth: 2)
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.body)
                            .fontWeight(.bold)
                        TextField("What's your decision description?", text: $formViewModel.cardModel.cardDescription, axis: .vertical)
                            .padding()
                            .lineLimit(8, reservesSpace: true)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.primary, lineWidth: 2)
                            )
                    }
                    
                    HStack(spacing: 55) {
                        VStack(alignment: .leading) {
                            Text("Deadline")
                                .font(.body)
                                .fontWeight(.bold)
                            
                            CustomDatePicker(selectedDate: $formViewModel.cardModel.deadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Time")
                                .font(.body)
                                .fontWeight(.bold)
                            
                            CustomHourPicker(selectedHour: $formViewModel.cardModel.time)
                        }
                    }
                    .padding(.trailing, 12)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 3) {
                            Text("Priority")
                                .font(.body)
                                .fontWeight(.bold)
                            Text("*")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundStyle(.red)
                        }
                        Picker("Priority", selection: $selectedPriority) {
                            ForEach(Priority.allCases) { priority in
                                Text(priority.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.primary, lineWidth: 2)
                        )
                    }
                }
                .padding()
                .padding(.top, 15)
                Spacer()
            }
        }
        .navigationTitle("New Decision")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Cancel")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: SecondPage(formViewModel: formViewModel, isPresented: $isPresented)) {
                    Text("Next")
                }
            }
        }
    }
}
