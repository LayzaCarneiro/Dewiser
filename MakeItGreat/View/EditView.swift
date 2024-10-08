//
//  EditView.swift
//  MakeItGreat
//
//  Created by Layza Maria Rodrigues Carneiro on 04/10/24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var card: CardModel
    
    @State private var selectedPriority: Priority = .medium
    
    enum Priority: String, CaseIterable, Identifiable {
        case low, medium, high
        var id: Self { self }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
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
                            TextField("What's your decision title?", text: $card.title)
                                .padding()
                                .frame(width: 361, height: 44)
                                .background(.backgroundField)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.stroke, lineWidth: 2)
                                )
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Description")
                                .font(.body)
                                .fontWeight(.bold)
                            TextField("What's your decision description?",
                                      text: Binding(
                                        get: {card.cardDescription ?? ""},
                                        set: {card.cardDescription = $0.isEmpty ? nil : $0}),
                                      axis: .vertical)
                            .padding()
                            .lineLimit(8, reservesSpace: true)
                            .background(.backgroundField)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.stroke, lineWidth: 2)
                            )
                        }
                        
                        HStack(spacing: 55) {
                            VStack(alignment: .leading) {
                                Text("Deadline")
                                    .font(.body)
                                    .fontWeight(.bold)
                                
                                CustomDatePicker(selectedDate: $card.deadline, isDateSelected: true)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Time")
                                    .font(.body)
                                    .fontWeight(.bold)
                                
                                CustomHourPicker(selectedHour: $card.time, isHourSelected: true)
                                
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
                            
                            CustomPriorityPicker(selectedPriority: $card.priorityEnum)
                            
                        }
                        
                        VStack(alignment: .leading) {
                            HStack(spacing: 3) {
                                Text("Feel")
                                    .font(.body)
                                    .fontWeight(.bold)
                                Text("*")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.red)
                                
                            }
                            CustomFeelingPicker(selectedFeeling: $card.feeling)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Edit Decision")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.text)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Save")
                            .foregroundStyle(.text)
                    }
                }
            }
        }
    }
}
