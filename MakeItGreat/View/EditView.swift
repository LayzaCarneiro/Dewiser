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
                    TextField("What is your decision title?", text: $card.title)
                        .padding()
                        .frame(width: 361, height: 44)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.primary, lineWidth: 2)
                        )
                }
                
//                VStack(alignment: .leading) {
//                    Text("Description")
//                        .font(.body)
//                        .fontWeight(.bold)
//                    TextField("What's your decision description?", text: $card.cardDescription, axis: .vertical)
//                        .padding()
//                        .lineLimit(8, reservesSpace: true)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(.primary, lineWidth: 2)
//                        )
//                }
//                
//                HStack(spacing: 55) {
//                    VStack(alignment: .leading) {
//                        Text("Deadline")
//                            .font(.body)
//                            .fontWeight(.bold)
//                        
//                        DatePicker("", selection: $card.deadline, displayedComponents: .date)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.primary, lineWidth: 2)
//                            )
//                    }
//                    
//                    VStack(alignment: .leading) {
//                        Text("Time")
//                            .font(.body)
//                            .fontWeight(.bold)
//                        
//                        DatePicker("", selection: $card.time, displayedComponents: .hourAndMinute)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.primary, lineWidth: 2)
//                            )
//                    }
//                }
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
            .padding(.top, -35)
        }
        .navigationTitle("Edit Decision")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.primary)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("Save")
                        .foregroundStyle(.primary)
                }
            }
        }
    }
}
